hl.config({
	general = {
		allow_tearing = true,

		gaps_in = 4,
		gaps_out = 8,

		border_size = 0,
	},

	decoration = {
		shadow = { enabled = false },
		glow = { enabled = false },

		rounding = 0,
		rounding_power = 2,

		active_opacity = 1,
		inactive_opacity = 1,

		blur = {
			enabled = true,
			size = 8,
			passes = 2,
			vibrancy = 1
		},
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 0, -- 0=off 1=on 2=fullscreen only 3=fullscreen with video/game
		font_family = 'JetBrainsMono Nerd Font',
		force_default_wallpaper = 0,
	},

	xwayland = {
		enabled = true,
		force_zero_scaling = true,
		use_nearest_neighbor = true
	},
})
