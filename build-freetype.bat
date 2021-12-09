@echo off

cd "%~dp0modules\freetype\build\"

:: Delete old binaries
echo | set /p="Removing FreeType binaries ... "
2>NUL del Release\freetype.lib
echo Done

:LB_BUILD

:: Check if project is configured
if not exist freetype.sln goto LB_NO_PROJECT

:: User information
echo.
echo [92mOpening Visual Studio for you:
echo [92mBuild the project [91mfreetype [92min [91mRELEASE MODE [92mand close the window when you're done![0m
echo Opening VS in 3 seconds... & Timeout 1 >NUL
echo Opening VS in 2 seconds... & Timeout 1 >NUL
echo Opening VS in 1 seconds... & Timeout 1 >NUL
echo Waiting for Visual Studio to close...

:: Start Visual Studio
start /wait freetype.sln

:: Check if it was successful
if not exist Release\freetype.lib goto LB_NO_BINARIES

:: Done
echo [92mFreeType was built successfully[0m
echo.

exit  & :: Exit successfully






:: No Project
:LB_NO_PROJECT

echo [91mProject files not found[0m

exit 1  & :: Exit error



:: No Binaries
:LB_NO_BINARIES

echo [91mFreeType binaries not found, did you compile in RELEASE mode?[0m
set /P c=Try again? [Y/n]: 
set repeat=true
if /I "%c%" EQU "n" set repeat=false
if /I "%c%" EQU "N" set repeat=false
if %repeat% == true goto LB_BUILD

exit 1  & :: Exit error
