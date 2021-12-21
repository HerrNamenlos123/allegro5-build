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

echo Cleaning Allegro 5 directory...
2>NUL rmdir /s /q "%~dp0/modules/allegro5/bin"
2>NUL rmdir /s /q "%~dp0/modules/allegro5/build"

echo Cleaning freetype directory...
2>NUL rmdir /s /q "%~dp0/modules/freetype/bin"
2>NUL rmdir /s /q "%~dp0/modules/freetype/build"

echo Cleaning libpng directory...
2>NUL rmdir /s /q "%~dp0/modules/libpng/bin"
2>NUL rmdir /s /q "%~dp0/modules/libpng/build"

echo Cleaning zlib directory...
2>NUL rmdir /s /q "%~dp0/modules/zlib/bin"
2>NUL rmdir /s /q "%~dp0/modules/zlib/build"

::call "%~dp0scripts\clean-freetype.bat"
::call "%~dp0scripts\clean-allegro5.bat"

Timeout 5
