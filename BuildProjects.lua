solution "gluac"

	language "C"
	location ( os.get() .."-".. _ACTION )
	flags { "Symbols", "NoEditAndContinue", "NoPCH", "StaticRuntime", "EnableSSE" }
	targetdir ( "lib/" .. os.get() .. "/" )
	includedirs { "include/GarrysMod", "include/" .. os.get(), "/usr/local/include/luajit-2.0/" }
	platforms{ "x32" }
	libdirs { "library/" .. os.get() }
	if os.get() == "linux" then
		links { "dl" }
	end
	
	configurations
	{ 
		"Release"
	}
	
	configuration "Release"
		if os.get() == "linux" then
			buildoptions { "-pthread -Wl,-z,defs" }
		end
		defines { "NDEBUG" }
		flags{ "Optimize", "FloatFast" }
	
	project "gluac"
		defines {}
		files { "src/**.*", "include/**.*" }
		kind "ConsoleApp"