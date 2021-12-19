@echo off

:: Available generators:
:: clean             Remove all binaries and generated files
:: codelite          Generate CodeLite project files
:: gmake             Generate GNU makefiles for POSIX, MinGW, and Cygwin
:: gmake2            Generate GNU makefiles for POSIX, MinGW, and Cygwin
:: vs2005            Generate Visual Studio 2005 project files
:: vs2008            Generate Visual Studio 2008 project files
:: vs2010            Generate Visual Studio 2010 project files
:: vs2012            Generate Visual Studio 2012 project files
:: vs2013            Generate Visual Studio 2013 project files
:: vs2015            Generate Visual Studio 2015 project files
:: vs2017            Generate Visual Studio 2017 project files
:: vs2019            Generate Visual Studio 2019 project files
:: xcode4            Generate Apple Xcode 4 project files

:: Set the project name and generator here. Leave the name empty to ask for it while generating
set _generator=vs2019



:: =============================================================================================

echo Generating project ...

call "%~dp0scripts\generate-freetype.bat"
call "%~dp0scripts\generate-allegro5.bat"

cd %~dp0
premake5\windows\premake5.exe %_generator% --file=premake5.lua
if %errorlevel% neq 0 Pause && exit 1
Timeout 5