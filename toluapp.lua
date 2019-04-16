-- scaffold geniefile for toluapp

toluapp_script = path.getabsolute(path.getdirectory(_SCRIPT))
toluapp_root = path.join(toluapp_script, "toluapp")

toluapp_includedirs = {
	path.join(toluapp_script, "config"),
	toluapp_root,
}

toluapp_libdirs = {}
toluapp_links = {}
toluapp_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { toluapp_includedirs }
	end,

	_add_defines = function()
		defines { toluapp_defines }
	end,

	_add_libdirs = function()
		libdirs { toluapp_libdirs }
	end,

	_add_external_links = function()
		links { toluapp_links }
	end,

	_add_self_links = function()
		links { "toluapp" }
	end,

	_create_projects = function()

project "toluapp"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		toluapp_includedirs,
	}

	defines {}

	files {
		path.join(toluapp_script, "config", "**.h"),
		path.join(toluapp_root, "**.h"),
		path.join(toluapp_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
