require("modules.environment")
require("modules.permissions")
require("modules.input")
require("modules.layout")
require("modules.rules")
require("modules.animations")
require("modules.monitors")
require("modules.background_shuffler")
require("modules.startup")

hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 1, -- 0=off 1=on 2=fullscreen only 3=fullscreen with video/game
		font_family = "JetBrainsMono Nerd Font",
		force_default_wallpaper = 0,
	},

	quirks = { prefer_hdr = 2 }, -- 0=off 1=always 2=gamescope

	render = {
		direct_scanout = 0, -- 0=off 1=on 2=auto
		cm_auto_hdr = 1,
	}, 

	xwayland = {
		enabled = true,
		force_zero_scaling = true,
		use_nearest_neighbor = true
	},
})


