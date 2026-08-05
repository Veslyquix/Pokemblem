@echo off
setlocal

set "root=%~dp0"
set "textprocess=%root%Tools\TextProcess\text-process-classic.exe"
set "parsefile=%root%EventAssembler\Tools\ParseFileUTF8.exe"

echo Building English text...
pushd "%root%Text" || exit /b 1
echo: | ("%textprocess%" text_buildfile.txt --parser-exe "%parsefile%" --installer "InstallTextData.event" --definitions "TextDefinitions.event")
if errorlevel 1 exit /b 1
popd

echo Building Chinese text...
pushd "%root%Language\Chinese" || exit /b 1
python extract_chinese_text.py
if errorlevel 1 exit /b 1
echo: | ("%textprocess%" text_buildfile.txt --parser-exe "%parsefile%" --installer "InstallTextData.event" --definitions "TextDefinitions.event")
if errorlevel 1 exit /b 1
python "%root%Language\remap_language_text_ids.py" Chinese
if errorlevel 1 exit /b 1
popd

echo Building Spanish text...
pushd "%root%Language\Spanish" || exit /b 1
echo: | ("%textprocess%" text_buildfile.txt --parser-exe "%parsefile%" --installer "InstallTextData.event" --definitions "TextDefinitions.event")
if errorlevel 1 exit /b 1
python "%root%Language\remap_language_text_ids.py" Spanish
if errorlevel 1 exit /b 1
popd

echo Text build complete.

pause 
