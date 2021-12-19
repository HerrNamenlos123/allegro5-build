


-- Main Solution
workspace "allegro5"
    configurations { "RelWithDebInfo" }

    platforms { "x64" }
    defaultplatform "x64"
    startproject "allegro_monolith"



-- libpng library
include "modules/libpng"

-- zlib library
include "modules/zlib"

-- FreeType library
include "modules/freetype"


-- The Allegro5 projects
externalproject "allegro_monolith"
location "modules/allegro5/build"
uuid "57940020-8E99-AEB6-271F-61E0F7F6B73B"
kind "StaticLib"
language "C++"
dependson "freetype"
dependson "zlib"
dependson "libpng"

externalproject "ZERO_CHECK"
location "modules/allegro5/build"
uuid "57940020-8E99-AEB6-271F-61E0F7F6B73C"
kind "Utility"

