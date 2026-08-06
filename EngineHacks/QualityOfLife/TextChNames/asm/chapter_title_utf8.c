#include "gbafe.h"

struct Utf8Glyph {
    struct Utf8Glyph *next;
    u8 codepointByte1;
    u8 width;
    u8 codepointByte2;
    u8 codepointByte3;
    u32 bitmap[16];
};

#define TEXT_GLYPH_TABLE ((struct Utf8Glyph *const *) 0x0858F6F4)

static const struct Utf8Glyph sMissingUtf8Glyph = {
    0,
    0,
    12,
    0,
    0,
    { 0 },
};

static u32 DecodeUtf8(const u8 *text, int *outLength) {
    u32 codepoint;
    u8 lead = text[0];
    int length;
    int i;

    if (lead < 0x80) {
        *outLength = 1;
        return lead;
    }

    if (lead < 0xC0)
        return 0;
    if (lead < 0xE0) {
        codepoint = lead & 0x1F;
        length = 2;
    } else if (lead < 0xF0) {
        codepoint = lead & 0x0F;
        length = 3;
    } else if (lead < 0xF8) {
        codepoint = lead & 0x07;
        length = 4;
    } else {
        return 0;
    }

    for (i = 1; i < length; ++i) {
        if ((text[i] & 0xC0) != 0x80)
            return 0;
        codepoint = (codepoint << 6) | (text[i] & 0x3F);
    }

    *outLength = length;
    return codepoint;
}

struct Utf8Glyph *ChapterTitleFindUtf8Glyph(const u8 *text) {
    int length = 0;
    u32 codepoint = DecodeUtf8(text, &length);
    struct Utf8Glyph *glyph;

    if (codepoint == 0 || length == 1)
        return 0;

    glyph = TEXT_GLYPH_TABLE[codepoint & 0xFF];
    while (glyph) {
        if (glyph->codepointByte1 == ((codepoint >> 8) & 0xFF)
            && glyph->codepointByte2 == ((codepoint >> 16) & 0xFF)
            && glyph->codepointByte3 == ((codepoint >> 24) & 0xFF))
            return glyph;
        glyph = glyph->next;
    }

    return (struct Utf8Glyph *) &sMissingUtf8Glyph;
}

int ChapterTitleDrawUtf8Glyph(const struct Utf8Glyph *glyph, void *destination, int x) {
    const u8 *bitmap = (const u8 *) glyph->bitmap;
    volatile u8 *tiles = (volatile u8 *) destination;
    int y;

    for (y = 0; y < 16; ++y) {
        int sourceRow = y * 4;
        int pixelX;

        for (pixelX = 0; pixelX < 16; ++pixelX) {
            int pixel = (bitmap[sourceRow + (pixelX >> 2)]
                >> ((pixelX & 3) * 2)) & 3;
            int destinationX;
            int byteOffset;
            int shift;
            volatile u32 *row;
            u32 value;

            if (pixel == 0)
                continue;

            destinationX = x + pixelX;
            byteOffset = ((y >> 3) * 0x400)
                + ((destinationX >> 3) * 0x20)
                + ((y & 7) * 4);
            shift = (destinationX & 7) * 4;
            row = (volatile u32 *) (tiles + byteOffset);
            value = *row;
            value &= ~(0xFu << shift);
            value |= (u32) pixel << shift;
            *row = value;
        }
    }

    return glyph->width + 1;
}
