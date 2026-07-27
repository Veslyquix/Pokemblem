#include "C_Code.h"
// extern int RedMugA_Link;
extern int RedMug_Link;
extern int LeafMug_Link;
extern int GetAvatarPortraitId(void);
extern const struct FaceData * sPortrait_data;
static int GetSpecialPortraitOrDefault(int portraitId)
{
    int specialPortraitId;

    if (portraitId != RedMug_Link && portraitId != LeafMug_Link)
    {
        return portraitId;
    }

    specialPortraitId = GetAvatarPortraitId();
    if (specialPortraitId)
    {
        return specialPortraitId;
    }

    return portraitId;
}

const struct FaceData * GetPortraitData(int fid)
{
    const struct FaceData * data = sPortrait_data;
    fid = GetSpecialPortraitOrDefault(fid);

    return data + fid;
}

int GetUnitPortraitId(struct Unit * unit)
{
    int portraitId = 0;
    portraitId = unit->pCharacterData->portraitId;

    if (!portraitId)
    {
        portraitId = unit->pClassData->defaultPortraitId;
    }
    if (portraitId && (unit->state & US_BIT23))
    { // portraitId+1 bitflag
        portraitId += 1;
    }

    return GetSpecialPortraitOrDefault(portraitId);
}
