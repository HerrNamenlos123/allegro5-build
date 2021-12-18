@echo off

:: ============== Cleaning old binaries =================

echo | set /p="Cleaning old allegro binaries ... "
2>NUL rmdir /s /q "%~dp0modules/allegro5-binaries/include"
2>NUL rmdir /s /q "%~dp0modules/allegro5-binaries/lib"
echo Done

:: ============== Generate freetype library now =================
call "%~dp0scripts\generate-freetype.bat"
if %errorlevel% NEQ 0 echo [91mFreetype failed to generate[0m & Pause & exit 1



:: ============== Build freetype library now =================
set /P c1= [92mBuild FreeType? [0m[Y/n]: 
set build=true
if /I "%c1%" EQU "n" set build=false
if /I "%c1%" EQU "N" set build=false
if %build% == true call "%~dp0scripts\build-freetype.bat"
if %errorlevel% NEQ 0 echo [91mFreetype failed to build[0m & Pause & exit 1




:: =============== Generate allegro build files =================
call "%~dp0scripts\generate-allegro5.bat"
if %errorlevel% NEQ 0 echo [91mAllegro5 failed to generate[0m & Pause & exit 1




:: =============== Build allegro5 library now =================
set /P c2=[92mBuild Allegro5? [0m[Y/n]: 
set build=true
if /I "%c2%" EQU "n" set build=false
if /I "%c2%" EQU "N" set build=false
if %build% == true call "%~dp0scripts\build-allegro5.bat"
if %errorlevel% NEQ 0 echo [91mAllegro5 failed to build[0m & Pause & exit 1


echo [92mAllegro5 was built successfully[0m


:: =============== Copy allegro5 binaries =================
cd "%~dp0"

echo | set /p="Copying allegro5 binaries ... "
echo.
xcopy modules\allegro5\build\lib\RelWithDebInfo\allegro_monolith-static.lib modules\allegro5-binaries\lib\ /K /D /H /Y /Q
echo Done

echo | set /p="Copying allegro5 include headers ... "
echo.
xcopy modules\allegro5\include modules\allegro5-binaries\include /E /H /C /I /Q
echo Done

echo | set /p="Copying additional allegro5 headers ... "
echo.
xcopy modules\allegro5\addons\font\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q
xcopy modules\allegro5\addons\ttf\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q
xcopy modules\allegro5\addons\primitives\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q
xcopy modules\allegro5\addons\image\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q
xcopy modules\allegro5\addons\native_dialog\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q
xcopy modules\allegro5\addons\memfile\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q
xcopy modules\allegro5\build\include modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q
echo Done

echo.
::echo [92mEverything was successful, now go to [94mmodules/allegro5-binaries[92m and push the repository to github.com[0m
echo [92mEverything was successful, pushing binaries to github.com ...[0m
cd modules\allegro5-binaries
git status
git add .
git commit -m "Updated binaries"
git push

echo.
echo [92mSuccessful[0m

Pause
