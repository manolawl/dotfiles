require("modules.programs")
require("modules.monitors")
require("modules.environment_variables")
require("modules.input")
require("modules.layouts")
require("modules.permissions")
require("modules.startup")
require("modules.animations")

hl.config({
	misc = {
		disable_hyprland_logo = true,
		font_family = "JetBrainsMono Nerd Font",
		force_default_wallpaper = 0,
	},

	quirks = { prefer_hdr = 2 },
	render = { direct_scanout = 0 },

	decoration = {
		rounding = 4,
		rounding_power = 2,
		active_opacity = 1,
		inactive_opacity = 1,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 2,
			color = "rgb(202020)"
		},

		blur {
			enabled = true,
			size = 4,
			passes = 2,
			vibrancy = 0
		}
	},

	xwayland = {
		enabled = true,
		force_zero_scaling = true,
		use_nearest_neighbor = true
	},

})


