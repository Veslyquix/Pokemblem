@echo off

@set "Png2Dmp=%~dp0/../../EventAssembler/Tools/Png2Dmp.exe"

@cd %~dp0/data

@dir *.png /b > png.txt

@for /f "tokens=*" %%m in (png.txt) do (
"%Png2Dmp%" "%%m" --lz77 -po "%%~nm_pal.dmp"
echo %%m
)

@del png.txt

echo Done!

pause