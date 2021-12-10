@echo off

echo | set /p="Cleaning FreeType build directory ... "
2>NUL rmdir /s /q "%~dp0..\modules\freetype\build"
echo Done
