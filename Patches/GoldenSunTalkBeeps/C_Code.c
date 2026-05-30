#include "C_Code.h" // headers

#define TALK_TEXT_BY_LINE(line) (sTalkText + ((line) + sTalkState->topTextNum) % sTalkState->lines)

// static struct TalkState sTalkStateCore;
extern struct TalkState * const sTalkState;
extern struct Text sTalkText[3];
// static int sTalkChoiceResult;
// static struct Font sTalkFont;

extern int SongTableStartID_Link;
extern int SongTableNumberOfBoops;
#define CHAR_NEWLINE 0x01
#define CHAR_A 0x3 // 0x1f
#define CHAR_SPACE 0x20
extern int EnableVanillaBeepsFlag;
int ShouldDoVanillaBoops()
{
    // return true;
    return CheckFlag(EnableVanillaBeepsFlag);
}

int GetNumberOfBoops()
{
    return 3; // SongTableNumberOfBoops;
}

struct FaceProc * GetSpeaker()
{
    int slot = sTalkState->activeFaceSlot;
    if (slot == 0xFF)
    {
        return NULL;
    }
    return sTalkState->faces[slot];
}
struct FaceDataBoop
{
    u8 pad[0x19];
    u8 boopID;
};
struct FaceProcBoop
{
    u8 pad[0x4c];
    u8 timer;
};
int GetBoopFirstID()
{
    struct FaceProc * proc = GetSpeaker();
    if (!proc)
    {
        return SongTableStartID_Link;
    }
    struct FaceDataBoop * data = (struct FaceDataBoop *)proc->pFaceInfo;
    int voiceID = data->boopID;
    if (!voiceID)
    {
        voiceID = 5;
    }
    return SongTableStartID_Link + (voiceID << 2) - 1;
}

extern int ReplaceSlowTextSpeed;

int GetTextDisplaySpeed(void)
{
    u8 speedLookup[4] = { 8, 4, 1, 0 };
    if (ReplaceSlowTextSpeed)
    {
        speedLookup[0] = 4;
        speedLookup[1] = 2;
    }
    return speedLookup[gPlaySt.config.textSpeed];
}

int HandleBoops()
{
    if (!ShouldDoVanillaBoops())
    {
        if (!CheckTalkFlag(TALK_FLAG_SILENT))
        {
            if (CheckTalkFlag(TALK_FLAG_7))
            {
                PlaySoundEffect(SONG_7A);
            }
            else
            {
                // struct FaceProcBoop * proc = (struct FaceProcBoop *)GetSpeaker();
                // proc->timer++;
                // if (proc->timer >= 6)
                // {
                // proc->timer = 2;
                // }

                switch (GetTextDisplaySpeed())
                {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    {
                        if (!((*sTalkState->str == CHAR_SPACE) || (*sTalkState->str == CHAR_NEWLINE) ||
                              (*sTalkState->str == CHAR_A))) // only boop after a space, newline, or [A]
                        {
                            return true;
                        }
                        break;
                    }
                    case 4: // vanilla speeds
                    case 8:
                    {
                        // maybe implement some sort of counter in the proc to see how long it's been since we played
                        // sfx
                        if (!((*sTalkState->str == CHAR_SPACE) || (*sTalkState->str == CHAR_NEWLINE) ||
                              (*sTalkState->str == CHAR_A)))
                        {
                            return true;
                        }
                        break;
                    }
                }

                if (sTalkState->instantScroll && sTalkState->unk82)
                {
                    return true;
                }
                // if (*sTalkState->str == CHAR_A)
                // {
                // brk;
                // }

                sTalkState->unk82 = 1;
                int sfxID = GetBoopFirstID() + NextRN_N(GetNumberOfBoops());
                PlaySoundEffect(sfxID);
            }
        }
        return false;
    }
    else // vanilla behaviour
    {

        if (!CheckTalkFlag(TALK_FLAG_SILENT))
        {
            if (CheckTalkFlag(TALK_FLAG_7))
            {
                PlaySoundEffect(SONG_7A);
            }
            else
            {
                if ((GetTextDisplaySpeed() == 1) && !(GetGameClock() & 1))
                {
                    return true;
                }

                if (sTalkState->instantScroll && sTalkState->unk82)
                {
                    return true;
                }

                sTalkState->unk82 = 1;
                PlaySoundEffect(SONG_6E);
            }
        }
    }
    return false;
}

//! FE8U = 0x08006C34
void Talk_OnIdle_(ProcPtr proc)
{

    if (IsTalkFaceMoving())
    {
        return;
    }

    if (!sTalkState->instantScroll)
    {
        sTalkState->printClock++;

        if (sTalkState->printClock < sTalkState->printDelay)
        {
            return;
        }
    }

    sTalkState->printClock = 0;

    while (1)
    {
        SetTalkFaceNoMouthMove(sTalkState->activeFaceSlot);

        switch (TalkInterpret(proc))
        {
            case 0:
                Proc_Break(proc);
                return;

            case 2:
                if (sTalkState->instantScroll || sTalkState->printDelay <= 0)
                {
                    break;
                }
                // HandleBoops();

                return;

            case 3:
                sTalkState->printClock = sTalkState->printDelay;
                sTalkState->instantScroll = 0;
                // HandleBoops();

                return;

            case 1:
            default:
            {
                if (!(CheckTalkFlag(TALK_FLAG_SPRITE)))
                {
                    if (TalkPrepNextChar(proc) == 1)
                    {
                        return;
                    }
                }
                else
                {
                    if (TalkSpritePrepNextChar(proc) == 1)
                    {
                        return;
                    }
                }

                sTalkState->str = Text_DrawCharacter(TALK_TEXT_BY_LINE(sTalkState->lineActive), sTalkState->str);
                HandleBoops();
                break;
            }
        }

        if (!sTalkState->instantScroll && sTalkState->printDelay > 0)
        {
            return;
        }
    }

    return;
}
