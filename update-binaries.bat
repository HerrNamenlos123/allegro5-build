@echo off

:: ============== Cleaning old binaries =================
echo | set /p="Cleaning old allegro binaries ... "
2>NUL rmdir /s /q "%~dp0modules/allegro5-binaries/include"
2>NUL rmdir /s /q "%~dp0modules/allegro5-binaries/lib"
echo Done

echo | set /p="Copying freetype binaries ... "
echo.
xcopy modules\freetype\bin\freetype.lib modules\allegro5-binaries\lib\ /K /D /H /Y /Q
echo Done

echo | set /p="Copying libpng binaries ... "
echo.
xcopy modules\libpng\bin\libpng.lib modules\allegro5-binaries\lib\ /K /D /H /Y /Q
echo Done

echo | set /p="Copying zlib binaries ... "
echo.
xcopy modules\zlib\bin\zlib.lib modules\allegro5-binaries\lib\ /K /D /H /Y /Q
echo Done

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
xcopy modules\allegro5\addons\font\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q /Y
xcopy modules\allegro5\addons\ttf\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q /Y
xcopy modules\allegro5\addons\primitives\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q /Y
xcopy modules\allegro5\addons\image\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q /Y
xcopy modules\allegro5\addons\native_dialog\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q /Y
xcopy modules\allegro5\addons\memfile\allegro5 modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q /Y
xcopy modules\allegro5\build\include modules\allegro5-binaries\include\allegro5 /E /H /C /I /Q /Y
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
echo [92mDone[0m

Pause
