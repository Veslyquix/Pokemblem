
#include "headers/prelude.h"
#include "headers/types.h"
#include "headers/gbafe.h"

#define ABS(aValue) ((aValue) >= 0 ? (aValue) : -(aValue))
extern u8 gCh;
extern int CheckFlag(int flag);
struct ReplaceTextStruct
{
    // conditions
    u16 flag;
    u8 chapterID;
    u8 pad;
    const char * find;
    const char * replace;
};
extern struct ReplaceTextStruct ReplaceTextList[];
#define TextBufferSize 0x1000
#define ListSize 255
extern char sMsgString[0x1000]; // fe7 202A5B4
extern u32 u32MsgString[0x400];
extern void SetMsgTerminator(char * str);
extern int Arm_DecompText(const char *, char *, u32 addr);
extern void (*gARM_DecompText)(const char *, char *); // fe8 3004150 fe7 3003940 fe6 3003780
extern void CallARM_DecompText(const char * a, char * b);
extern const u8 *** const ggMsgStringTable; // a2a0 is POIN TextTable
extern int sActiveMsg;

/*
char * GetStringFromIndex(int index) // so we can set sActiveMsg as the index
{
    // if (index == sActiveMsg)
    // return sMsgString.buffer1;
    sActiveMsg = index;
    CallARM_DecompText((void *)ggMsgStringTable[index], sMsgString);
#ifdef FE8
    SetMsgTerminator(sMsgString);
#endif
    return sMsgString;
}
*/
int GetStringLength(const char * str)
{
    for (int i = 0; i < 0x1000; ++i)
    {
        if (!str[i])
            return i;
    }
    return 0;
}
int GetEndOfBuffer(char * buffer)
{
    for (int i = 0; i < 0x1000; ++i)
    {
        if (!buffer[i])
        {
            return i;
        }
    }
    return 0;
}
void ShiftDataInBuffer(char * buffer, int amount, int offset, int usedBufferLength[])
{
    if (amount == 0)
        return;

    int length = usedBufferLength[0];

    // Sanity check
    if (offset < 0 || offset > length)
        return;

    if (amount < 0)
    {
        // Left shift
        int absAmount = -amount;

        if (offset + absAmount > length)
            return; // Prevent invalid read

        int bytesToMove = length - (offset + absAmount);

        // Manual safe copy: shift left
        for (int i = 0; i < bytesToMove; ++i)
        {
            buffer[offset + i] = buffer[offset + absAmount + i];
        }

        // Zero the trailing garbage
        for (int i = length - absAmount; i < length; ++i)
        {
            buffer[i] = 0;
        }

        usedBufferLength[0] -= absAmount;
    }
    else
    {
        // Right shift
        if (length + amount >= 0x1000)
            return;

        int bytesToMove = length - offset;

        // Manual safe copy: shift right (back to front to avoid overwrite)
        for (int i = bytesToMove - 1; i >= 0; --i)
        {
            buffer[offset + amount + i] = buffer[offset + i];
        }

        // Zero the gap we created
        for (int i = offset; i < offset + amount; ++i)
        {
            buffer[i] = 0;
        }

        usedBufferLength[0] += amount;
    }

    // Optional: null-terminate buffer (if treated as a C string)
    buffer[usedBufferLength[0]] = 0;
}

void ShiftDataInBufferSmall(char * buffer, int amount, int offset, int usedBufferLength[])
{
    if (amount == 0)
        return;

    int length = usedBufferLength[0];

    if (amount < 0)
    {
        int absAmount = -amount;

        if (offset + absAmount > length)
            return;

        int bytesToMove = length - (offset + absAmount);
        for (int i = 0; i < bytesToMove; ++i)
        {
            buffer[offset + i] = buffer[offset + absAmount + i];
        }

        for (int i = length - absAmount; i < length; ++i)
        {
            buffer[i] = 0;
        }

        usedBufferLength[0] -= absAmount;
    }
    else
    {
        if (length + amount >= 0x1000)
            return;

        for (int i = length - 1; i >= offset; --i)
        {
            buffer[i + amount] = buffer[i];
        }

        for (int i = offset; i < offset + amount; ++i)
        {
            buffer[i] = 0;
        }

        usedBufferLength[0] += amount;
    }
}

int ReplaceIfMatching(int usedBufferLength[], const char * find, const char * replace, int c, char * b)
{

    int i;
    char * buffer = &b[c];
    if (!find[0])
        return 0;

    for (i = 0; find[i]; ++i) // while find[i] is non-zero (eg. a character), compare
    {
        if (buffer[i] != find[i])
            return 0; // mismatch
    }

    int len2 = GetStringLength(replace);
    int bufLength = usedBufferLength[0];
    if (len2 != bufLength)
    {
        if (bufLength < 16)
        {
            ShiftDataInBufferSmall(b, len2 - i, c, usedBufferLength);
        }
        else
        {
            ShiftDataInBuffer(b, len2 - i, c, usedBufferLength);
        }
    }

    for (i = 0; i < len2; ++i)
    {
        buffer[i] = replace[i];
    }
    return len2;
}

static int ParseNumberHex(const char * str, int start, int digits)
{
    int result = 0;

    for (int i = 0; i < digits; ++i)
    {
        char c = str[start + i];
        int value;

        if (c >= '0' && c <= '9')
        {
            value = c - '0';
        }
        else if (c >= 'A' && c <= 'F')
        {
            value = 10 + (c - 'A');
        }
        else if (c >= 'a' && c <= 'f')
        {
            value = 10 + (c - 'a');
        }
        else
        {
            break; // stop on first non-hex character
        }

        result = (result << 4) | value; // multiply by 16
    }

    return result;
}
void RemoveRange(char * buffer, int start, int end, int usedLength[1])
{
    int length = usedLength[0];

    if (start < 0 || end < start || end > length)
        return;

    int removeSize = end - start;

    int bytesToMove = length - end;

    // Move remaining data left
    for (int i = 0; i < bytesToMove; i++)
    {
        buffer[start + i] = buffer[end + i];
    }

    // Update length
    usedLength[0] -= removeSize;

    // Clear trailing bytes (optional but good)
    for (int i = usedLength[0]; i < length; i++)
    {
        buffer[i] = 0;
    }

    // Ensure null termination
    buffer[usedLength[0]] = 0;
}
static int IsIfTag(const char * b, int i)
{
    return (b[i] == '<' && b[i + 1] == 'i' && b[i + 2] == 'f');
}

static int IsEndIf(const char * b, int i)
{
    return (
        b[i] == '<' && b[i + 1] == 'e' && b[i + 2] == 'n' && b[i + 3] == 'd' && b[i + 4] == 'i' && b[i + 5] == 'f' &&
        b[i + 6] == '>');
}
extern struct Unit * GetUnitFromCharId(int id);
static int IsUnitAlive(int id)
{
    struct Unit * unit = GetUnitFromCharId(id);
    if (!UNIT_IS_VALID(unit))
    {
        return false;
    }
    if (unit->state & US_DEAD)
    {
        return false;
    }
    return true;
}
static int IsUnitDead(int id)
{
    struct Unit * unit = GetUnitFromCharId(id);
    if (!UNIT_IS_VALID(unit))
    {
        return false;
    }
    if (unit->state & US_DEAD)
    {
        return true;
    }
    return false;
}

static int IsUnitMissing(int id)
{
    struct Unit * unit = GetUnitFromCharId(id);
    if (!UNIT_IS_VALID(unit))
    {
        return true;
    }
    return false;
}

static int TryHandleConditional(char * b, int i, int usedLength[1])
{
    if (!IsIfTag(b, i))
    {
        // Remove stray [endif]
        if (IsEndIf(b, i))
        {
            RemoveRange(b, i, i + 7, usedLength);
            return 1;
        }
        return 0;
    }

    int condition = 0;
    int tagEnd = i;

    // Determine which IF type
    if (b[i + 3] == 'F') // ifFlag
    {
        int flag = ParseNumberHex(b, i + 7, 3);
        condition = CheckFlag(flag);
    }
    else if (b[i + 3] == 'A') // ifAlive
    {
        int charId = ParseNumberHex(b, i + 8, 2);
        condition = IsUnitAlive(charId);
    }
    else if (b[i + 3] == 'D') // ifDead
    {
        int charId = ParseNumberHex(b, i + 7, 2);
        condition = IsUnitDead(charId);
    }
    else if (b[i + 3] == 'M') // ifMissing
    {
        int charId = ParseNumberHex(b, i + 10, 2);
        condition = IsUnitMissing(charId);
    }
    else
    {
        return 0; // unknown tag
    }

    // find closing bracket of opening tag
    while (b[tagEnd] && b[tagEnd] != '>')
        ++tagEnd;

    if (!b[tagEnd])
        return 0;

    tagEnd++; // include '>'

    // Remove the [ifXXXX] tag itself
    RemoveRange(b, i, tagEnd, usedLength);

    if (condition)
        return 1; // keep inner contents

    // CONDITION FALSE — remove until matching endif
    int depth = 1;
    int scan = i;

    while (scan < usedLength[0])
    {
        if (IsIfTag(b, scan))
        {
            depth++;
        }
        else if (IsEndIf(b, scan))
        {
            depth--;

            if (depth == 0)
            {
                RemoveRange(b, i, scan + 7, usedLength);
                return 1;
            }
        }

        scan++;
    }

    return 1;
}

extern int ControlCodesStartWithBracket;
void CallARM_DecompText(const char * a, char * b) // 2ba4 // fe7 8004364 fe6 800384C
{
    int length[1] = { 0 };
    if ((int)a & 0x80000000)
    { // anti huffman
        a = (const char *)((int)a & 0x7FFFFFFF);
        for (int i = 0; i < 0x1000; ++i)
        {
            b[i] = a[i];
            if (!a[i])
            {
                length[0] = i;
                break;
            }
        }
    }
    else
    {
#ifdef FE8
        length[0] = Arm_DecompText(a, b, 0x3004150);
#endif
#ifdef FE7
        length[0] = Arm_DecompText(a, b, 0x3003940);
#endif
#ifdef FE6
        length[0] = Arm_DecompText(a, b, 0x3003780);
#endif
    }
#ifdef FE8
// SetMsgTerminator(b);
#endif
    if (length[0] < 0xFFF)
    {
        b[length[0]] = 0;
        b[length[0] + 1] = 0;
    }

    int replacedLen = 0;
    for (int i = 0; i < length[0]; ++i)
    {
        if (!b[i])
        {
            return;
        }
        if (TryHandleConditional(b, i, length))
        {
            i--;
            continue;
        }

        if (ControlCodesStartWithBracket && b[i] != 0x3C) // control codes to start with `<`
        {
            continue;
        }

        for (int c = 0; c < ListSize; ++c)
        {
            if (!b[i])
            {
                return;
            }

            if (!ReplaceTextList[c].find)
            {
                break;
            }
            if (ReplaceTextList[c].flag)
            {
                if (!CheckFlag(ReplaceTextList[c].flag))
                {
                    continue;
                }
            }
            if (ReplaceTextList[c].chapterID != 0xFF)
            {
                if (gCh != ReplaceTextList[c].chapterID)
                {
                    continue;
                }
            }

            replacedLen = ReplaceIfMatching(length, ReplaceTextList[c].find, ReplaceTextList[c].replace, i, b);
            if (replacedLen)
            {
                i += replacedLen - 1;
                break;
            }
        }
    }
}