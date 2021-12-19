
project "libpng"
	language "C++"
	kind "StaticLib"
	targetname "libpng"
	targetdir "bin"
	staticruntime "on"
	runtime "Release"
	symbols "On"
	location "build"

	system "Windows"
	architecture "x86_64"

	includedirs { "include", "../zlib/include" }
	defines { "NDEBUG", "PNG_SETJMP_NOT_SUPPORTED", "WIN32_LEAN_AND_MEAN" }

	files {
		"include/**",
		"src/**",
		"premake5.lua"
	}
