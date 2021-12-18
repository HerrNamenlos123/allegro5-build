@echo off

cd "%~dp0..\modules\allegro5\build\"

:: Delete old binaries
echo | set /p="Removing Allegro5 binaries ... "
2>NUL del lib\RelWithDebInfo\allegro_monolith-static.lib
echo Done

:LB_BUILD

:: Check if project is configured
if not exist allegro.sln goto LB_NO_PROJECT

:: User information
echo.
echo [92mOpening Visual Studio for you:
echo [92mBuild the project [91mallegro5_monolith [92mand close the window when you're done![0m
echo Opening VS in 3 seconds... & Timeout 1 >NUL
echo Opening VS in 2 seconds... & Timeout 1 >NUL
echo Opening VS in 1 seconds... & Timeout 1 >NUL
echo Waiting for Visual Studio to close...

:: Start Visual Studio
start /wait ALLEGRO.sln

:: Check if it was successful
if not exist lib\RelWithDebInfo\allegro_monolith-static.lib goto LB_NO_BINARIES

:: Done
echo [92mAllegro5 was built successfully[0m
echo.

set errorlevel=0 & goto :eof  & :: Exit successfully






:: No Project
:LB_NO_PROJECT

echo [91mProject files not found[0m

set errorlevel=1 & goto :eof  & :: Exit error



:: No Binaries
:LB_NO_BINARIES

echo [91mAllegro5 binaries not found, did you compile in RELEASE mode?[0m
set /P c3=Try again? [Y/n]: 
set repeat=true
if /I "%c3%" EQU "n" set repeat=false
if /I "%c3%" EQU "N" set repeat=false
if %repeat% == true goto LB_BUILD

set errorlevel=1 & goto :eof  & :: Exit error
