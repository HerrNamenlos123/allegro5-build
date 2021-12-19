@echo off

:: ============== Generate allegro5 library files =================

mkdir "%~dp0..\modules\allegro5\build" 2>NUL
cd "%~dp0..\modules\allegro5\build"

cmake .. -Wno-dev -DPREFER_STATIC_DEPS=true -DSHARED=false -DWANT_DOCS=false -DWANT_DOCS_HTML=false ^
-DWANT_EXAMPLES=false -DWANT_FONT=true -DWANT_MONOLITH=true -DWANT_TESTS=false -DWANT_RELEASE_LOGGING=false ^
-DWANT_STATIC_RUNTIME=true -DFREETYPE_INCLUDE_DIRS=../freetype/src;../freetype/include ^
-DFREETYPE_LIBRARIES=../freetype/build/Release/freetype.lib

if %errorlevel% neq 0 echo [91mCMake was unsuccessful[0m & set errorlevel=1 & goto :eof

set errorlevel=0 & goto :eof
