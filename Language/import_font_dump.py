import argparse
import os
import re
import shutil


GLYPH_DUMP_RE = re.compile(r'^Font(?P<kind>Item|Text).*?_(?P<hex>[0-9A-Fa-f]{1,6})\.png$')
INVALID_FILENAME_CHARS = set('<>:"/\\|?*')


def is_safe_filename_char(char):
	if len(char) != 1:
		return False
	
	codepoint = ord(char)
	if codepoint < 0x20:
		return False
	
	return char not in INVALID_FILENAME_CHARS and char not in ('.', ' ')


def canonical_glyph_name(kind, codepoint):
	char = chr(codepoint)
	if is_safe_filename_char(char):
		return 'Font' + kind + char + '.png'
	
	return 'Font' + kind + '_' + format(codepoint, 'X') + '.png'


def import_font_dump(font_dump_dir, font_data_dir, dry_run=False):
	stats = {
		'imported': 0,
		'new': 0,
		'overwritten': 0,
		'duplicates': 0,
		'skipped': 0,
		'item': 0,
		'text': 0,
	}
	seen_destinations = set()
	
	for entry in sorted(os.scandir(font_dump_dir), key=lambda file: file.name):
		if not entry.is_file() or not entry.name.lower().endswith('.png'):
			continue
		
		match = GLYPH_DUMP_RE.match(entry.name)
		if match is None:
			stats['skipped'] += 1
			continue
		
		kind = match.group('kind')
		codepoint = int(match.group('hex'), 16)
		dest_name = canonical_glyph_name(kind, codepoint)
		dest_path = os.path.join(font_data_dir, dest_name)
		
		if dest_path in seen_destinations:
			stats['duplicates'] += 1
			continue
		
		seen_destinations.add(dest_path)
		stats[kind.lower()] += 1
		
		if os.path.exists(dest_path):
			stats['overwritten'] += 1
		else:
			stats['new'] += 1
		
		stats['imported'] += 1
		
		if not dry_run:
			shutil.copy2(entry.path, dest_path)
	
	return stats


def main():
	parser = argparse.ArgumentParser(description='Import dumped Chinese font PNGs into FontData.')
	parser.add_argument('--font-dump', default='FontDump')
	parser.add_argument('--font-data', default='FontData')
	parser.add_argument('--dry-run', action='store_true')
	args = parser.parse_args()
	
	stats = import_font_dump(args.font_dump, args.font_data, args.dry_run)
	for key in ('imported', 'item', 'text', 'new', 'overwritten', 'duplicates', 'skipped'):
		print(key + ': ' + str(stats[key]))


if __name__ == '__main__':
	main()
