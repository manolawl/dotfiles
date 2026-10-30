hl.config({
	general = {
		allow_tearing = true,

		gaps_in =  8,
		gaps_out = 16,

		border_size = 1,
		col = {
			active_border =   '#e2dff9a6',
			inactive_border = '#71707da6',
		}
	},

	decoration = {
		shadow = { enabled = false },
		glow =   { enabled = false },

		rounding =       8,
		rounding_power = 2,

		active_opacity =   1,
		inactive_opacity = 1,

		blur = {
			enabled =    true,
			xray =       false,
			size =       4,
			passes =     2,
			noise =      0,
			vibrancy =   0.25,
			brightness = 0.50,
			contrast =   0.75,
		},
	},

	misc = {
		font_family =              'JetBrainsMono Nerd Font',
		disable_hyprland_logo =    true,
		disable_splash_rendering = true,
		vrr =                      0, -- 0=off 1=on 2=fullscreen only 3=fullscreen with video/game
		force_default_wallpaper =  0,
	},

	xwayland = {
		enabled =              true,
		force_zero_scaling =   true,
		use_nearest_neighbor = true
	},
})
