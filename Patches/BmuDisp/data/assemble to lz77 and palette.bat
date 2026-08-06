@echo off
@set "Png2Dmp=%~dp0\..\..\..\EventAssembler\Tools\Png2Dmp.exe"
@rem call with palette output and compression
@dir *.png /b > png.txt

@for /f "tokens=*" %%m in (png.txt) do ("%Png2Dmp%" "%%m" --lz77)
@del png.txt
echo Done!
pause
