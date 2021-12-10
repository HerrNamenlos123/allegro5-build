@echo off

echo | set /p="Cleaning Allegro5 build directory ... "
2>NUL rmdir /s /q "%~dp0..\modules\allegro5\build"
echo Done
