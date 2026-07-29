#include "gbafe.h" // headers

#define PUREFUNC __attribute__((pure))
#define ARMFUNC __attribute__((target("arm")))
int Div(int a, int b) PUREFUNC;
int Mod(int a, int b) PUREFUNC; // vanilla mod doesn't guard against div by 0, so be careful
int DivArm(int b, int a) PUREFUNC;

extern int SkillTester(struct Unit * unit, int SkillID);
extern int RandomizeWeaponStatsFlag_Link;
extern int RandomizeClassesFlag_Link;

// if both on, randomize all 0xA0+
// if only bosses, 0xA0+ in "boss chapters"
// if only trainers, 0xA0+ in non-boss chapters
extern int RandomizeTrainerClassesFlag_Link;
extern int RandomizeBossClassesFlag_Link;
extern int RandomizeGrowthsFlag_Link;
extern int RandomizeFoundItemsFlag_Link;
extern int RandomizeBaseStatsFlag_Link;
extern int RandomizeSkillsFlag_Link;

extern char * TacticianName; // 8 bytes long

#define POKEMBLEM_VERSION
#ifdef POKEMBLEM_VERSION
extern u32 * StartTimeSeedRamLabel;
#endif
#include "NumberEntry.c"

// extern int Div(int, int);
// extern int Mod(int, int);
u32 GetNthRN_Simple(int n, u32 seed, u32 currentRN);
u32 HashSeed(u32 result)
{
    int clock = GetGameClock();
    // result = (GetNthRN_Simple(clock, (clock & 0xF)) << 4) | GetNthRN_Simple(clock, (clock & 0xF0));
    result = GetNthRN_Simple(clock, result, 13);
    if (!result)
    {
        result = GetGameClock() << 9;
    }
    if (result > 999999)
    {
        result &= 0xEFFFF;
    }
    return result;
}

u32 NextSeededRN_Simple(u32 rn)
{
    // This generates a pseudorandom string of 32 bits
    u32 rn0 = rn & 0xFFFF;
    u32 rn1 = rn >> 16;
    rn = (rn1 << 11) + (rn0 >> 5) + (rn0 << 16);

    // Shift state[2] one bit
    rn0 *= 2;

    // "carry" the top bit of state[1] to state[0]
    if (rn1 & 0x8000)
        rn0++;

    rn ^= rn0;
    return rn;
}

extern const u32 RNTable[]; // = { 0x924EA36E };

u32 InitSeededRN_Simple(int seed, u32 currentRN)
{
    // This table is a collection of 8 possible initial rn state
    // 3 entries will be picked based of which "seed" was given

    u16 initTable[8] = { 0xA36E, 0x924E, 0xB784, 0x4F67, 0x8092, 0x592D, 0x8E70, 0xA794 };

    int mod = Mod(seed, 7);

    currentRN = initTable[(mod++ & 7)];
    currentRN |= initTable[(mod++ & 7)] << 16;

    if (Mod(seed, 23) > 0)
    {
        for (mod = Mod(seed, 23); mod != 0; mod--)
        {
            currentRN = NextSeededRN_Simple(currentRN);
        }
    }

    return currentRN;
}

u32 GetNthRN_Simple(int n, u32 seed, u32 currentRN)
{
    int i = n + seed;
    i = (i ^ (i >> 12)) & 0x3FFF;
    // n = (n ^ (n >> 4)) & 0xF;
    n &= 0xF;
    if (!currentRN)
    {
        currentRN = RNTable[i]; // InitSeededRN_Simple(seed, currentRN);
    }
    for (int i = 0; i < n; i++)
    {
        currentRN = NextSeededRN_Simple(currentRN);
    }
    return currentRN;
}

u16 HashByte_Global(int number, int max, int variance)
{
    // Mix values without large multiplications
    if (!max)
    {
        return 0;
    }

    int offset = *StartTimeSeedRamLabel;
    offset ^= variance * 29;
    offset ^= number * 37;

    // Lightweight bit scrambling
    offset ^= (offset >> 4) ^ (offset << 3);
    offset *= 40503; // Smaller prime (fits in 16-bit)

    u32 currentRN = GetNthRN_Simple(offset, *StartTimeSeedRamLabel, 0);

    return Mod((currentRN & 0x2FFFFFFF), max);
}

u8 HashByte_Ch(int number, int max, int variance)
{
    if (!max)
    {
        return 0;
    }
    int offset = gPlaySt.chapterIndex;
    offset ^= variance * 29;
    offset ^= number * 37;

    // Lightweight bit scrambling
    offset ^= (offset >> 4) ^ (offset << 3);
    offset *= 40503; // Smaller prime (fits in 16-bit)

    u32 currentRN = GetNthRN_Simple(offset, *StartTimeSeedRamLabel, 0);

    return Mod((currentRN & 0x2FFFFFFF), max);
}

u16 HashShort_Ch(int number, int max, int variance)
{
    if (!max)
    {
        return 0;
    }
    int offset = gPlaySt.chapterIndex;
    offset ^= variance * 29;
    offset ^= number * 37;

    // Lightweight bit scrambling
    offset ^= (offset >> 4) ^ (offset << 3);
    offset *= 40503; // Smaller prime (fits in 16-bit)

    u32 currentRN = GetNthRN_Simple(offset, *StartTimeSeedRamLabel, 0);

    return Mod((currentRN & 0x2FFFFFFF), max);
}

int GetItemMight(int item)
{
    item &= 0xFF;
    int might = GetItemData(item)->might;
    if (!CheckFlag(RandomizeWeaponStatsFlag_Link))
        return might;
    int max = ((might * 3) / 2) + 5;
    int newMight = HashByte_Global(might, max, item);
    if (abs(newMight - might) < 3)
    { // encourage it to be at least 3 or more points different than normal
        newMight = HashByte_Global(newMight, max, newMight);
    }
    return newMight;
}

int GetItemHit(int item)
{
    item &= 0xFF;
    int hit = GetItemData(item)->hit;
    if (!CheckFlag(RandomizeWeaponStatsFlag_Link))
        return GetItemData(item)->hit;
    int newHit = (HashByte_Global(hit, (hit + 40) / 5, item) * 5) + 35;
    if (newHit > 250)
        newHit = 250;
    return newHit;
}

int GetItemCrit(int item)
{
    item &= 0xFF;
    int crit = GetItemData(item)->crit;
    if (!CheckFlag(RandomizeWeaponStatsFlag_Link))
        return GetItemData(item)->crit;
    int newCrit = HashByte_Global(crit, ((crit * 2) + 40) / 5, item) * 5;
    if (newCrit > 250)
        newCrit = 250;
    return newCrit;
}

extern u8 BossChapterTable2[];
int ShouldUnitBeRandomized(struct Unit * unit)
{
    int unitID = unit->pCharacterData->number;
    if ((CheckFlag(RandomizeClassesFlag_Link)) && (unitID < 0xA0))
        return true;
    int randomizeBosses = CheckFlag(RandomizeBossClassesFlag_Link);
    int randomizeTrainers = CheckFlag(RandomizeTrainerClassesFlag_Link);

    if ((randomizeBosses) && (randomizeTrainers) && (unitID >= 0xA0))
        return true;
    int isBoss = unit->pCharacterData->attributes & CA_BOSS; // class doesn't exist yet
    if ((randomizeBosses) && (isBoss))
        return true;

    if (!randomizeTrainers)
    {
        if ((unitID >= 0xA0) && (randomizeBosses) && (BossChapterTable2[gPlaySt.chapterIndex]))
            return true;
        return false;
    }

    if (!randomizeBosses)
    { // if not boss chapter, return true
        if ((unitID >= 0xA0) && (randomizeTrainers) && (!BossChapterTable2[gPlaySt.chapterIndex]))
            return true;
        return false;
    }
    return false; // default
}

int GetMaxStr(struct Unit * unit);
int GetMaxSkl(struct Unit * unit);
int GetMaxSpd(struct Unit * unit);
int GetMaxDef(struct Unit * unit);
int GetMaxRes(struct Unit * unit);
int GetMaxMag(struct Unit * unit);
int GetMaxLck(struct Unit * unit);
int GetMaxStrV(struct Unit * unit, int variance);
int GetMaxSklV(struct Unit * unit, int variance);
int GetMaxSpdV(struct Unit * unit, int variance);
int GetMaxDefV(struct Unit * unit, int variance);
int GetMaxResV(struct Unit * unit, int variance);
int GetMaxMagV(struct Unit * unit, int variance);
int GetMaxLckV(struct Unit * unit, int variance);
struct magClassTable
{
    u8 base;
    u8 growth;
    u8 cap;
    u8 promo;
};
struct classLuckTable
{
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 cap;
};
extern struct classLuckTable ClassLuckTable[];
extern struct magClassTable MagClassTable[];

int GetAverageCap(struct Unit * unit)
{
    int classID = unit->pClassData->number;
    int i = 0;
    int result = UNIT_POW_MAX(unit);
    i++;
    result += UNIT_SKL_MAX(unit);
    i++;
    result += UNIT_SPD_MAX(unit);
    i++;
    result += UNIT_DEF_MAX(unit);
    i++;
    result += UNIT_RES_MAX(unit);
    i++;
    result += MagClassTable[classID].cap;
    i++;
    // result += ClassLuckTable[classID].cap;
    // result += ClassMaxHPTable[classID].cap;
    return (result / i);
}

int * BubbleSort(int a[], int array_size)
{
    int i, j, temp;
    for (i = 0; i < (array_size - 1); ++i)
    {
        for (j = 0; j < array_size - 1 - i; ++j)
        {
            if (a[j] > a[j + 1])
            {
                temp = a[j + 1];
                a[j + 1] = a[j];
                a[j] = temp;
            }
        }
    }
    return a;
}

int Get2ndLowestCap(struct Unit * unit)
{
    int classID = unit->pClassData->number;
    int a[6];
    a[0] = UNIT_POW_MAX(unit);
    a[1] = UNIT_SKL_MAX(unit);
    a[2] = UNIT_SPD_MAX(unit);
    a[3] = UNIT_DEF_MAX(unit);
    a[4] = UNIT_RES_MAX(unit);
    a[5] = MagClassTable[classID].cap;
    // a = ClassLuckTable[classID].growth;
    // a = ClassMaxHPTable[classID].growth;
    return BubbleSort(a, 6)[1];
}
int Get2ndHighestCap(struct Unit * unit)
{
    int classID = unit->pClassData->number;
    int a[6];
    a[0] = UNIT_POW_MAX(unit);
    a[1] = UNIT_SKL_MAX(unit);
    a[2] = UNIT_SPD_MAX(unit);
    a[3] = UNIT_DEF_MAX(unit);
    a[4] = UNIT_RES_MAX(unit);
    a[5] = MagClassTable[classID].cap;
    // a = ClassLuckTable[classID].growth;
    // a = ClassMaxHPTable[classID].growth;
    return BubbleSort(a, 6)[4];
}

int GetAverageGrowth(struct Unit * unit)
{
    int classID = unit->pClassData->number;
    int i = 0;
    int result = unit->pClassData->growthPow + 10;
    i++;
    result += unit->pClassData->growthSkl + 10;
    i++;
    result += unit->pClassData->growthSpd + 10;
    i++;
    result += unit->pClassData->growthDef + 10;
    i++;
    result += unit->pClassData->growthRes + 10;
    i++;
    result += MagClassTable[classID].growth + 10;
    i++;
    // result += ClassLuckTable[classID].growth;
    // result += ClassMaxHPTable[classID].growth;
    return (result / i);
}

// mov r2, r6 @ index in stat booster pointer of growth
int GetRandomizedGrowth(struct Unit * unit, int growth, int id)
{ // index in stat booster pointer of growth
    if (!CheckFlag(RandomizeGrowthsFlag_Link))
    {
        return growth;
    }
    int uid = unit->pCharacterData->number;

    int avgCap = GetAverageCap(unit);
    if ((uid >= 0x50) && (uid < 0x87))
    {
        growth += 10;
    } // so wilds match players
    if ((uid > 0x8C) && (uid < 0xA0))
    {
        growth += 10;
    }
    int newGrowth = growth;
    int avgGrowth = GetAverageGrowth(unit);

    int cid = id + unit->pClassData->number;
    newGrowth = HashByte_Global(newGrowth, avgGrowth + ((avgCap * 3) / 2), cid) + (avgCap / 2);
    int result = newGrowth;
    if ((result - growth) > 99)
    {
        result = 99;
    } // more than +99 growth looks bad on stat screen
    if ((growth - result) > 99)
    {
        result = growth - 99;
    } // more than +99 growth looks bad on stat screen
    // HP
    if (id == 10)
    {
        return result;
    }

    // average random + half of the cap
    typedef int (*func_unit_int)(struct Unit *, int);
    // void func ( int (*f)(int) ) = GetMaxStr();
    func_unit_int func = &GetMaxStrV;

    // STR
    if (id == 11)
    {
        func = &GetMaxStrV;
    }
    // SKL
    if (id == 12)
    {
        func = &GetMaxSklV;
    }
    // SPD
    if (id == 13)
    {
        func = &GetMaxSpdV;
    }
    // DEF
    if (id == 14)
    {
        func = &GetMaxDefV;
    }
    // RES
    if (id == 15)
    {
        func = &GetMaxResV;
    }
    // LCK
    if (id == 16)
    {
        func = &GetMaxLckV;
    }
    // MAG
    if (id == 17)
    {
        func = &GetMaxMagV;
    }

    int statCap = func(unit, 0);

    result = (statCap * 5) / 2; //((statCap*3)/2); // + (newGrowth/5);
    newGrowth = HashByte_Global(statCap, avgCap / 4, cid);
    int max = (avgGrowth * 3) / 2;
    if (result > max)
    {
        result = max;
    }

    result -= newGrowth;
    if (((result - growth) < 20) && ((result - growth) >= 0))
    {
        result += newGrowth;
    }
    if (((growth - result) < 20) && ((growth - result) >= 0))
    {
        result -= newGrowth;
    }

    // if (abs(result - growth) < 20) { result = ((func(unit, result)*3)/2) + (result/5); }
    // if (abs(result - growth) < 20) { result = ((func(unit, result)*3)/2) + (result/5); }
    // if (abs(result - growth) < 20) { result = ((func(unit, result)*3)/2) + (result/5); }
    // if (abs(result - growth) < 20) { result = ((func(unit, result)*3)/2) + (result/5); }
    if (result < 0)
    {
        result = 0;
    }
    if ((result - growth) > 99)
    {
        result = 99;
    } // more than +99 growth looks bad on stat screen
    if ((growth - result) > 99)
    {
        result = growth - 99;
    } // more than +99 growth looks bad on stat screen
    return result;
}

int RandStat(int stat, int variance, int avgCap, int statCap)
{
    int max = (statCap / 6) + (avgCap / 6) + (stat / 6);
    int min = avgCap / 10;
    max -= min;
    max = max < 63 ? max : 63; // cap at 63
    return HashByte_Global(stat, max, variance) + min;
}

void RandomizeStats(struct Unit * unit)
{
    if (!CheckFlag(RandomizeBaseStatsFlag_Link))
    {
        return;
    }
    int classID = unit->pClassData->number;
    int avgCap = GetAverageCap(unit);

    unit->maxHP = RandStat(unit->maxHP, classID, avgCap, unit->maxHP * 3);
    if (unit->maxHP < 10)
    {
        unit->maxHP += 10;
    }
    unit->pow = RandStat(unit->pow, classID, avgCap, GetMaxStr(unit));
    unit->skl = RandStat(unit->skl, classID, avgCap, GetMaxSkl(unit));
    unit->spd = RandStat(unit->spd, classID, avgCap, GetMaxSpd(unit));
    unit->def = RandStat(unit->def, classID, avgCap, GetMaxDef(unit));
    unit->res = RandStat(unit->res, classID, avgCap, GetMaxRes(unit));
    unit->lck = RandStat(unit->lck, classID, avgCap, GetMaxLck(unit));
    unit->_u3A = RandStat(unit->_u3A, classID, avgCap, GetMaxMag(unit)); // mag
}

int RandomizeStatCap(int statCap, struct Unit * unit, int variance)
{
    int avgCap = GetAverageCap(unit);
    int min = (avgCap / 4); // eg. 8 - 15
    int max = avgCap;
    int low = Get2ndLowestCap(unit);
    int high = Get2ndHighestCap(unit);
    max -= min;
    if (statCap >= high)
    {
        max = (max * 15) / 10;
    } // encourage best 2 stats to be lower
    if (statCap <= low)
    {
        max = (max * 22) / 10;
    } // encourage worst 2 stats to be higher
    if ((statCap > low) && (statCap < high))
    {
        max = ((avgCap * 18) / 10);
    } // eg. 45 - 90

    int classID = unit->pClassData->number + variance;
    int result = HashByte_Global(statCap, max, classID) + min;

    if (abs(result - statCap) < (avgCap / 2))
    {
        result = HashByte_Global(result, max, classID) + min;
    } // reroll if too similar
    if (abs(result - statCap) < (avgCap / 2))
    {
        result = HashByte_Global(result, max, classID) + min;
    } // reroll if too similar
    if (abs(result - statCap) < 16)
    {
        result = HashByte_Global(result, max, classID) + min;
    } // reroll if too similar
    if (abs(result - statCap) < 11)
    {
        result = HashByte_Global(result, max, classID) + min;
    } // reroll if too similar
    if (abs(result - statCap) < 6)
    {
        result = HashByte_Global(result, max + min, classID);
    } // reroll if too similar (no min)

    if (result >= 60)
    {
        result = 60 - HashByte_Global(result, min, classID);
    }
    return result;
}

int GetMaxStrV(struct Unit * unit, int variance)
{
    int rand = CheckFlag(RandomizeGrowthsFlag_Link);
    int num = UNIT_POW_MAX(unit);
    if (!rand)
    {
        return num;
    }
    return RandomizeStatCap(num, unit, 0 + variance); // extra variance variable so stats with same max will differ
}
int GetMaxStr(struct Unit * unit)
{
    return GetMaxStrV(unit, 0);
}

int GetMaxSklV(struct Unit * unit, int variance)
{
    int rand = CheckFlag(RandomizeGrowthsFlag_Link);
    int num = UNIT_SKL_MAX(unit);
    if (!rand)
    {
        return num;
    }
    return RandomizeStatCap(num, unit, 1 + variance);
}
int GetMaxSkl(struct Unit * unit)
{
    return GetMaxSklV(unit, 0);
}

int GetMaxSpdV(struct Unit * unit, int variance)
{
    int rand = CheckFlag(RandomizeGrowthsFlag_Link);
    int num = UNIT_SPD_MAX(unit);
    if (!rand)
    {
        return num;
    }
    return RandomizeStatCap(num, unit, 2 + variance);
}
int GetMaxSpd(struct Unit * unit)
{
    return GetMaxSpdV(unit, 0);
}

int GetMaxDefV(struct Unit * unit, int variance)
{
    int rand = CheckFlag(RandomizeGrowthsFlag_Link);
    int num = UNIT_DEF_MAX(unit);
    if (!rand)
    {
        return num;
    }
    return RandomizeStatCap(num, unit, 3 + variance);
}
int GetMaxDef(struct Unit * unit)
{
    return GetMaxDefV(unit, 0);
}

int GetMaxResV(struct Unit * unit, int variance)
{
    int rand = CheckFlag(RandomizeGrowthsFlag_Link);
    int num = UNIT_RES_MAX(unit);
    if (!rand)
    {
        return num;
    }
    return RandomizeStatCap(num, unit, 4 + variance);
}
int GetMaxRes(struct Unit * unit)
{
    return GetMaxResV(unit, 0);
}

int GetMaxMagV(struct Unit * unit, int variance)
{
    int rand = CheckFlag(RandomizeGrowthsFlag_Link);
    int magCap = MagClassTable[unit->pClassData->number].cap;
    if (!rand)
    {
        return magCap;
    }
    return RandomizeStatCap(magCap, unit, 5 + variance);
}
int GetMaxMag(struct Unit * unit)
{
    return GetMaxMagV(unit, 0);
}

int GetMaxLckV(struct Unit * unit, int variance)
{
    int rand = CheckFlag(RandomizeGrowthsFlag_Link);
    int num = ClassLuckTable[((unit)->pClassData->number)].cap;
    if (!rand)
    {
        return num;
    }
    return RandomizeStatCap(num, unit, 6 + variance);
}
int GetMaxLck(struct Unit * unit)
{
    return GetMaxLckV(unit, 0);
}

void RandomizeStatCaps(struct BattleUnit * bu, struct Unit * unit)
{

    int max = GetMaxStr(unit);
    if ((unit->pow + bu->changePow) > max)
    {
        bu->changePow = max - unit->pow;
    }

    max = GetMaxSkl(unit);
    if ((unit->skl + bu->changeSkl) > max)
    {
        bu->changeSkl = max - unit->skl;
    }

    max = GetMaxSpd(unit);
    if ((unit->spd + bu->changeSpd) > max)
    {
        bu->changeSpd = max - unit->spd;
    }

    max = GetMaxDef(unit);
    if ((unit->def + bu->changeDef) > max)
    {
        bu->changeDef = max - unit->def;
    }

    max = GetMaxRes(unit);
    if ((unit->res + bu->changeRes) > max)
    {
        bu->changeRes = max - unit->res;
    }

    max = GetMaxLck(unit);
    if ((unit->lck + bu->changeLck) > max)
    {
        bu->changeLck = max - unit->lck;
    }

    max = GetMaxMag(unit);
    if ((unit->_u3A + bu->changeCon) > max)
    {
        bu->changeCon = max - unit->_u3A;
    }
}

void UnitRandomizeStatCaps(struct Unit * unit)
{

    int max = GetMaxStr(unit);
    if (unit->pow > max)
    {
        unit->pow = max;
    }

    max = GetMaxSkl(unit);
    if (unit->skl > max)
    {
        unit->skl = max;
    }

    max = GetMaxSpd(unit);
    if (unit->spd > max)
    {
        unit->spd = max;
    }

    max = GetMaxDef(unit);
    if (unit->def > max)
    {
        unit->def = max;
    }

    max = GetMaxRes(unit);
    if (unit->res > max)
    {
        unit->res = max;
    }

    max = GetMaxLck(unit);
    if (unit->lck > max)
    {
        unit->lck = max;
    }

    max = GetMaxMag(unit);
    if (unit->_u3A > max)
    {
        unit->_u3A = max;
    }
}

extern u16 * RandomItemsTable[];
int CountItems(int tier)
{
    int i = 0;
    while (RandomItemsTable[tier][i])
    {
        i++;
    }
    return i;
}

int GetItemTier(int item)
{
    for (int tier = 0; tier < 4; tier++)
    {
        int i = 0;
        while (RandomItemsTable[tier][i])
        {
            if (item == RandomItemsTable[tier][i])
            {
                return HashByte_Ch(item, 2, i) + tier; // return 1 tier higher half the time for fun I guess
                                                       // (Mod 2 means max 1)
            }
            i++;
        }
    }
    int itemID_only = item & 0xFF;
    for (int tier = 0; tier < 4; tier++)
    {
        int i = 0;
        while (RandomItemsTable[tier][i])
        {
            if (itemID_only == RandomItemsTable[tier][i])
            {
                return HashByte_Ch(item, 2, i) + tier; // return 1 tier higher half the time for fun I guess
            }
            i++;
        }
    }
    return 0; // if we can't find it, treat it as tier 0
}
int RandomizeItem(int item)
{
    if (!item)
    {
        return item;
    }
    int tier = GetItemTier(item);
    int max = CountItems(tier);
    return RandomItemsTable[tier][HashShort_Ch(item, max, 0)];
}

void RandomizeItem_ASMC(void)
{
    if (!CheckFlag(RandomizeFoundItemsFlag_Link))
    {
        return;
    }
    int item = gEventSlots[3];
    int tier = GetItemTier(item);
    int max = CountItems(tier);
    gEventSlots[3] = RandomItemsTable[tier][HashShort_Ch(item, max, 1)];
}
void RandomizeCoins_ASMC(void)
{
    if (!CheckFlag(RandomizeFoundItemsFlag_Link))
    {
        return;
    }
    int coins = gEventSlots[3];
    int max = coins * 2;
    if (max > 65000)
    {
        max = 65000;
    }
    gEventSlots[3] = HashShort_Ch(coins, max, 2);
}

extern u8 RandomSkillsTable[];
int CountSkills()
{
    int i = 0;
    while (RandomSkillsTable[i])
    {
        i++;
    }
    return i;
}

extern u8 PlusModeRandomSkills[];
extern int PlusFlag_Link;
static bool IsSkillIDValid(u8 skillID)
{
    return skillID != 0 && skillID != 255;
}
u8 GetPlusModeRandomSkill(struct Unit * unit)
{
    int id = unit->pCharacterData->number;
    int count = 0;
    if (UNIT_FACTION(unit) == FACTION_RED && CheckFlag(PlusFlag_Link))
    {
        while (IsSkillIDValid(PlusModeRandomSkills[count]))
        {
            ++count;
        }

        if (!count)
        {
            return 0;
        }

        return PlusModeRandomSkills[HashByte_Ch(id, count, unit->pClassData->number)];
    }
    return 0;
}

int RandomizeSkill(int id, int classID)
{
    if (!CheckFlag(RandomizeSkillsFlag_Link))
    {
        return id;
    }
    int max = CountSkills();
    return RandomSkillsTable[HashByte_Global(id, max, classID)];
}

/*
int GetLowestGrowth(struct Unit* unit) {
        int classID = unit->pClassData->number;
        int a = 0;
        int result = unit->pClassData->growthPow + 10;
        if (a < result) { result = a; }
        a = unit->pClassData->growthSkl + 10;
        if (a < result) { result = a; }
        a = unit->pClassData->growthSpd + 10;
        if (a < result) { result = a; }
        a = unit->pClassData->growthDef + 10;
        if (a < result) { result = a; }
        a = unit->pClassData->growthRes + 10;
        if (a < result) { result = a; }
        a = MagClassTable[classID].growth + 10;
        if (a < result) { result = a; }
        //a = ClassLuckTable[classID].growth;
        //a = ClassMaxHPTable[classID].growth;
        return result;
}
int GetHighestGrowth(struct Unit* unit) {
        int classID = unit->pClassData->number;
        int a = 0;
        int result = unit->pClassData->growthPow + 10;
        if (a > result) { result = a; }
        a = unit->pClassData->growthSkl + 10;
        if (a > result) { result = a; }
        a = unit->pClassData->growthSpd + 10;
        if (a > result) { result = a; }
        a = unit->pClassData->growthDef + 10;
        if (a > result) { result = a; }
        a = unit->pClassData->growthRes + 10;
        if (a > result) { result = a; }
        a = MagClassTable[classID].growth + 10;
        if (a > result) { result = a; }
        //a = ClassLuckTable[classID].growth;
        //a = ClassMaxHPTable[classID].growth;
        return result;
} */
