typedef int8_t    s8;
typedef int16_t    s16;

// For translate-able strings.
#define JTEXT(orig) (orig)
#define TEXT(orig, english) (orig)

#include "gba.h"
#include "proc.h" 
#include "unit.h" 
#include "item.h" 

#define ABS(aValue) ((aValue) >= 0 ? (aValue) : -(aValue))



