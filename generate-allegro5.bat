@echo off

:: ============== Generate allegro5 library files =================
echo.
echo [94m======= Generating build files for Allegro5 library =========[0m
echo.
mkdir "%~dp0modules\allegro5\build" 2>NUL
cd "%~dp0modules\allegro5\build"

cmake .. -Wno-dev -DPREFER_STATIC_DEPS=true -DSHARED=false -DWANT_DOCS=false -DWANT_DOCS_HTML=false ^
-DWANT_EXAMPLES=false -DWANT_FONT=true -DWANT_MONOLITH=true -DWANT_TESTS=false -DWANT_RELEASE_LOGGING=false ^
-DWANT_STATIC_RUNTIME=true -DFREETYPE_INCLUDE_DIRS=../../freetype/src -DFREETYPE_LIBRARIES=../../freetype/build/Release/freetype.lib

if %errorlevel% neq 0 echo [91mCMake was unsuccessful[0m & exit 1

echo.
set /P c=[92mCheck the output, is everything correct? [0m[Y/n]: 
set correct=true
if /I "%c%" EQU "n" set correct=false
if /I "%c%" EQU "N" set correct=false
if %correct% == false goto LB_ERROR

echo.
echo [94m======== Done generating build files for Allegro5 ===========[0m

Pause
exit


:LB_ERROR
echo [91mAborting generation script...[0m
Pause
exit 1
