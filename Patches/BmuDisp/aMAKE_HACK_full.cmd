@echo off


set "source_rom=%~dp0FE8_clean.gba"
set "source_sym=%~dp0FE8_clean.sym
set "vanilla_rom=%~dp0FE8_clean.gba"

set "main_event=%~dp0Installer.event"

set "target_rom=%~dp0aHack.gba"
set "target_ups=%~dp0aHack.ups"
set "target_sym=%~dp0aHack.sym"

@rem defining tools


set "ups=%~dp0Tools\ups\ups"
set symcombo=%~dp0Tools\sym\SymCombo.exe

@rem set %~dp0 into a variable because batch is stupid and messes with it when using conditionals?

set "base_dir=%~dp0"

@rem do the actual building

echo Copying ROM

copy "%source_rom%" "%target_rom%"

echo:
echo Assembling

cd "%base_dir%EventAssembler"
ColorzCore A FE8 "-output:%target_rom%" "-input:%main_event%" --nocash-sym "--build-times"

@rem  echo:
@rem  echo Generating patch

@rem  cd "%base_dir%"
@rem  "%ups%" diff -b "%vanilla_rom%" -m "%target_rom%" -o "%target_ups%"


echo:
echo Generating sym file

echo: | ( "%symcombo%" "%target_sym%" "%target_sym%" "%source_sym" )
@rem echo: | ( "%symcombo%" "%target_sym%" "%target_sym%" "%base_dir%\Tools\sym\VanillaOffsets.sym" )

echo:
echo Done!

pause
