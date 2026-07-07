from pathlib import Path

from PIL import Image
import imagequant


directory = Path('raw')
output_directory = Path('Png')
canvas_size = (248, 160)
portrait_size = (64, 64)
portrait_offset = (128, 48)
transparent_display_color = (0, 255, 0)
max_colors = 16


def flatten_palette(palette):
    palette_data = []
    for color in palette:
        palette_data.extend(color)
    return palette_data


def rgb_palette_from_rgba(palette_data):
    return [
        list(palette_data[index:index + 3])
        for index in range(0, len(palette_data), 4)
    ]


def ensure_transparent_index_zero(out_pixels, rgba_palette, rgba_bytes):
    pixels = bytearray(out_pixels)
    palette = rgb_palette_from_rgba(rgba_palette)
    transparent_positions = []
    opaque_zero_positions = []
    opaque_indices = set()

    for pixel_index, palette_index in enumerate(pixels):
        alpha = rgba_bytes[pixel_index * 4 + 3]
        if alpha == 0:
            transparent_positions.append(pixel_index)
        else:
            opaque_indices.add(palette_index)
            if palette_index == 0:
                opaque_zero_positions.append(pixel_index)

    if not transparent_positions:
        return bytes(pixels), flatten_palette(palette)

    if not palette:
        palette.append([0, 0, 0])

    if opaque_zero_positions:
        old_zero_color = palette[0]
        transparent_indices = {pixels[index] for index in transparent_positions}
        replacement_index = next(
            (
                index for index in transparent_indices
                if index != 0 and index not in opaque_indices
            ),
            None,
        )

        if replacement_index is None:
            used_indices = set(pixels)
            replacement_index = next(
                (index for index in range(1, max_colors) if index not in used_indices),
                None,
            )

        if replacement_index is None:
            raise RuntimeError('No free palette slot available for opaque index 0 pixels.')

        while len(palette) <= replacement_index:
            palette.append([0, 0, 0])

        palette[replacement_index] = old_zero_color
        for index in opaque_zero_positions:
            pixels[index] = replacement_index

    for index in transparent_positions:
        pixels[index] = 0

    palette[0] = list(transparent_display_color)
    return bytes(pixels), flatten_palette(palette)


output_directory.mkdir(exist_ok=True)

dir_entries = directory.iterdir()
for entry in dir_entries:
    if entry.is_file() and entry.suffix.lower() == '.png':
        print(f'{entry.name}')

#step 1: open & resize image
        
        portrait_filename = entry
        with Image.open(portrait_filename) as source_image:
            im = source_image.convert('RGBA')



        mug = im


        mug = mug.resize(portrait_size, Image.LANCZOS) # NEAREST, BILINEAR, BICUBIC, LANCZOS 

        im5 = Image.new("RGBA", canvas_size)

        im5.paste(mug, portrait_offset, mug)

        img = im5

        rgba_bytes = img.tobytes()
        out_pixels, rgba_palette = imagequant.quantize_raw_rgba_bytes(
            rgba_bytes,
            img.width,
            img.height,
            max_colors=max_colors - 1,
        )
        out_pixels, palette_data = ensure_transparent_index_zero(out_pixels, rgba_palette, rgba_bytes)
        out_img = Image.frombytes('P', (img.width, img.height), out_pixels)

        out_img.putpalette(palette_data)
        
        


        im5 = out_img#.quantize(16)

        im5.save(output_directory / entry.name, quality=100, optimize=True)

        #print(f"Png/{entry.name}" + ".txt")
        #with open(f"bin/{entry.name}" + ".bin", 'w') as fp: 
         #   pass # make a bunch of empty .bin files to write over when exporting via feb 

        with open(output_directory / f"{entry.name}.txt", 'w') as f:
            f.write('/// - Mode 1\n')
            f.write('C03\n')
            f.write('C07\n')
            f.write('7 p- ' + f"{entry.name}\n")
            f.write('C05\n')
            f.write('C01\n')
            f.write('7 p- ' + f"{entry.name}\n")
            f.write('C06\n')
            f.write('C0D\n')
            f.write('~~~\n')
            f.write('/// - Mode 3\n')
            f.write('C03\n')
            f.write('C07\n')
            f.write('7 p- ' + f"{entry.name}\n")
            f.write('C05\n')
            f.write('C01\n')
            f.write('7 p- ' + f"{entry.name}\n")
            f.write('C06\n')
            f.write('C0D\n')
            f.write('~~~\n')
            f.write('/// - Mode 5\n')
            f.write('C03\n')
            f.write('C07\n')
            f.write('7 p- ' + f"{entry.name}\n")
            f.write('C06\n')
            f.write('C0D\n')
            f.write('~~~\n')
            f.write('/// - Mode 6\n')
            f.write('C03\n')
            f.write('C07\n')
            f.write('7 p- ' + f"{entry.name}\n")
            f.write('C05\n')
            f.write('C01\n')
            f.write('~~~\n')
            f.write('/// - Mode 7\n')
            f.write('C02\n')
            f.write('4 p- ' + f"{entry.name}\n")
            f.write('4 p- ' + f"{entry.name}\n")
            f.write('C0E\n')
            f.write('20 p- ' + f"{entry.name}\n")
            f.write('4 p- ' + f"{entry.name}\n")
            f.write('4 p- ' + f"{entry.name}\n")
            f.write('C01\n')
            f.write('C0D\n')
            f.write('~~~\n')
            f.write('/// - Mode 8\n')
            f.write('C02\n')
            f.write('4 p- ' + f"{entry.name}\n")
            f.write('4 p- ' + f"{entry.name}\n")
            f.write('C0E\n')
            f.write('20 p- ' + f"{entry.name}\n")
            f.write('4 p- ' + f"{entry.name}\n")
            f.write('4 p- ' + f"{entry.name}\n")
            f.write('C01\n')
            f.write('C0D\n')
            f.write('~~~\n')
            f.write('/// - Mode 9\n')
            f.write('3 p- ' + f"{entry.name}\n")
            f.write('C01\n')
            f.write('~~~\n')
            f.write('/// - Mode 10\n')
            f.write('3 p- ' + f"{entry.name}\n")
            f.write('C01\n')
            f.write('~~~\n')
            f.write('/// - Mode 11\n')
            f.write('3 p- ' + f"{entry.name}\n")
            f.write('C01\n')
            f.write('~~~\n')
            f.write('/// - Mode 12\n')
            f.write('4 p- ' + f"{entry.name}\n")
            f.write('C01\n')
            f.write('~~~\n')
            f.write('/// - End of animation\n')



