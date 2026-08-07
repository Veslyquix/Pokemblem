@echo off

set "textprocess=%~dp0..\..\Tools\TextProcess\text-process-classic.exe"
set "parsefile=%~dp0..\..\EventAssembler\Tools\ParseFileUTF8.exe"

echo: | ("%textprocess%" text_buildfile.txt --parser-exe "%parsefile%" --installer "InstallTextData.event" --definitions "TextDefinitions.event")
if errorlevel 1 goto end
python "%~dp0..\remap_language_text_ids.py" Chinese

:end
pause
