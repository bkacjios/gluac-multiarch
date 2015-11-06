solution "gluac"

	language "C"
	location ( os.get() .."-".. _ACTION )
	flags { "Symbols", "NoEditAndContinue", "NoPCH", "StaticRuntime", "EnableSSE" }
	targetdir ( "bin/" .. os.get() .. "/" )
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
		files { "src/**.*" }
		kind "ConsoleApp"