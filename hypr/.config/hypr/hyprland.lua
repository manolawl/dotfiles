require("modules.environment_variables")
require("modules.permissions")
require("modules.input")
require("modules.layouts")
require("modules.rules")
require("modules.animations")
require("modules.monitors")
require("modules.startup")

hl.config({
	misc = {
		disable_hyprland_logo = true,
		font_family = "JetBrainsMono Nerd Font",
		force_default_wallpaper = 0,
	},

	quirks = { prefer_hdr = 2 },
	render = { direct_scanout = 0 },

	xwayland = {
		enabled = true,
		force_zero_scaling = true,
		use_nearest_neighbor = true
	},
})


