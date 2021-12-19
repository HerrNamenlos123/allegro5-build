@echo off

::echo | set /p="Cleaning old allegro binaries ... "
::2>NUL rmdir /s /q "%~dp0modules/allegro5-binaries/include"
::2>NUL rmdir /s /q "%~dp0modules/allegro5-binaries/lib"
::echo Done

echo Cleaning Visual Studio solution...
2>NUL del "%~dp0*.sln"

echo Cleaning Visual Studio cache...
2>NUL rmdir /s /q "%~dp0/.vs"

echo Cleaning bin directory...
2>NUL rmdir /s /q "%~dp0/bin"

echo Cleaning build directory...
2>NUL rmdir /s /q "%~dp0/build"

call "%~dp0scripts\clean-freetype.bat"
call "%~dp0scripts\clean-allegro5.bat"

Timeout 5
