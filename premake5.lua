function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

-- Utility function
function appendTable(tableA, tableB)
    for _,v in ipairs(tableB) do 
        table.insert(tableA, v) 
    end
end


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

ALLEGRO5_INCLUDE_DIRS = { _SCRIPT_DIR .. "/include", _SCRIPT_DIR .. "/src" }

ALLEGRO5_LINK_DIRS = { _SCRIPT_DIR .. "/bin/" }
appendTable(ALLEGRO5_LINK_DIRS, FREETYPE_LINK_DIRS)
appendTable(ALLEGRO5_LINK_DIRS, LIBPNG_LINK_DIRS)
appendTable(ALLEGRO5_LINK_DIRS, ZLIB_LINK_DIRS)

ALLEGRO5_LINKS = { "allegro_monolith-static" }
appendTable(ALLEGRO5_LINKS, FREETYPE_LINKS)
appendTable(ALLEGRO5_LINKS, LIBPNG_LINKS)
appendTable(ALLEGRO5_LINKS, ZLIB_LINKS)
