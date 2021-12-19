


-- Main Solution
workspace "Allegro5"
    configurations { "RelWithDebInfo" }

    platforms { "x64" }
    defaultplatform "x64"
    --startproject (projectName)



-- libpng library
include "modules/libpng"

-- zlib library
include "modules/zlib"



-- Freetype
externalproject "freetype"
location "modules/freetype/build"
uuid "57940020-8E99-AEB6-271F-61E0F7F6B73D"
kind "StaticLib"
language "C++"


-- The Allegro5 projects
externalproject "allegro_monolith"
location "modules/allegro5/build"
uuid "57940020-8E99-AEB6-271F-61E0F7F6B73B"
kind "StaticLib"
language "C++"
dependson "freetype"

externalproject "ZERO_CHECK"
location "modules/allegro5/build"
uuid "57940020-8E99-AEB6-271F-61E0F7F6B73C"
kind "Utility"

