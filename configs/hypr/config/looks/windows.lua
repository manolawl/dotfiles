hl.config({
	general = {
		allow_tearing = true,

		gaps_in =  4,
		gaps_out = 8,

		border_size = 0,
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
			xray =       true,
			size =       8,
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
