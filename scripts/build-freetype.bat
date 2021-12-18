@echo off

cd "%~dp0..\modules\freetype\build\"

:: Delete old binaries
echo | set /p="Removing FreeType binaries ... "
2>NUL del Release\freetype.lib
echo Done

:LB_BUILD

:: Check if project is configured
if not exist freetype.sln goto LB_NO_PROJECT


:: User information
echo.
echo Opening Visual Studio for you after this info:
echo You must RIGHT-Click the project [91mfreetype[0m, go to [91mProperties[0m and make sure the Configuration at the top is [91mRelease[0m.
echo "Next, under [91mC/C++[0m -> [91mCode Generation[0m, set [91mRuntime Library[0m to [91mMulti-threaded (/MT)[0m and close the properties panel."
echo Next, build the project [91mfreetype [0min [91mRELEASE MODE [0mand close the window when you're done![0m
set /P c4=Did you understand? [Y/n]: 
set understood=true
if /I "%c4%" EQU "n" set understood=false
if /I "%c4%" EQU "N" set understood=false
if %understood% == false goto LB_NOT_UNDERSTOOD

:: Start Visual Studio
echo Waiting for Visual Studio to close...
start /wait freetype.sln

:: Check if it was successful
if not exist Release\freetype.lib goto LB_NO_BINARIES

:: Done
echo [92mFreeType was built successfully[0m
echo.

set errorlevel=0 & goto :eof  & :: Exit successfully






:: No Project
:LB_NO_PROJECT

echo [91mProject files not found[0m

set errorlevel=1 & goto :eof  & :: Exit error



:: Not understood what to do
:LB_NOT_UNDERSTOOD

echo [91mAborting build process...[0m

set errorlevel=1 & goto :eof  & :: Exit error



:: No Binaries
:LB_NO_BINARIES

echo [91mFreeType binaries not found, did you compile in RELEASE mode?[0m
set /P c4=Try again? [Y/n]: 
set repeat=true
if /I "%c4%" EQU "n" set repeat=false
if /I "%c4%" EQU "N" set repeat=false
if %repeat% == true goto LB_BUILD

set errorlevel=1 & goto :eof  & :: Exit error
