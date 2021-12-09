@echo off

:: ============== Generate freetype library files =================
echo.
echo [94m======= Generating build files for FreeType library =========[0m
echo.
mkdir "%~dp0modules\freetype\build" 2>NUL
cd "%~dp0modules\freetype\build"

cmake .. -Wno-dev -DFT_DISABLE_BROTLI=true -DFT_DISABLE_BZIP2=true -DFT_DISABLE_HARFBUZZ=true -DFT_DISABLE_PNG=true -DFT_DISABLE_ZLIB=true 

if %errorlevel% neq 0 echo [91mCMake was unsuccessful[0m & exit 1

echo.
echo [94m======== Done generating build files for FreeType ===========[0m
