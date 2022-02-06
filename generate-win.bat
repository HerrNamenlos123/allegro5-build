@echo off

:: Available generators:
:: clean             Remove all binaries and generated files
:: codelite          Generate CodeLite project files
:: gmake             Generate GNU makefiles for POSIX, MinGW, and Cygwin
:: gmake2            Generate GNU makefiles for POSIX, MinGW, and Cygwin
:: vs2005            Generate Visual Studio 2005 project files
:: vs2008            Generate Visual Studio 2008 project files
:: vs2010            Generate Visual Studio 2010 project files
:: vs2012            Generate Visual Studio 2012 project files
:: vs2013            Generate Visual Studio 2013 project files
:: vs2015            Generate Visual Studio 2015 project files
:: vs2017            Generate Visual Studio 2017 project files
:: vs2019            Generate Visual Studio 2019 project files
:: xcode4            Generate Apple Xcode 4 project files

:: Set the project name and generator here. Leave the name empty to ask for it while generating
set _generator=vs2019               & rem Only for premake! CMake is not set! 



:: =============================================================================================

echo Generating project ...

mkdir "%~dp0modules\allegro5\build" 2>NUL
cd "%~dp0modules\allegro5\build"

cmake .. -Wno-dev ^
    -DPREFER_STATIC_DEPS=true ^
    -DSHARED=false ^
    -DWANT_DOCS=false ^
    -DWANT_DOCS_HTML=false ^
    -DWANT_EXAMPLES=false ^
    -DWANT_FONT=true ^
    -DWANT_MONOLITH=true ^
    -DWANT_TESTS=false ^
    -DWANT_DEMO=false ^
    -DWANT_RELEASE_LOGGING=false ^
    -DWANT_STATIC_RUNTIME=true ^
    -DFREETYPE_INCLUDE_DIRS=../freetype/src;../freetype/include ^
    -DFREETYPE_LIBRARIES=../freetype/build/Release/freetype.lib ^
    -DPNG_INCLUDE_DIR=../libpng/include/;../zlib/include/ ^
    -DPNG_LIBRARIES=../libpng/bin/libpng.lib

if %errorlevel% neq 0 echo [91mCMake was unsuccessful[0m & Pause & exit 1

echo.
cd %~dp0
premake5\windows\premake5.exe %_generator% && start allegro5.sln
echo.

if %errorlevel% neq 0 Pause & exit 1

Pause