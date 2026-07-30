@echo off 
cd /d "%~dp0"
python image_to_tmx.py Route19.png Vermilion.png --output Route19.tmx --preview Route19_from_Vermilion_preview.png --tileset-name Vermilion --tile-width 16 --tile-height 16
pause
