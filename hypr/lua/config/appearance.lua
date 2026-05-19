hl.config({
	general = {
		allow_tearing = true,

		gaps_in = 6,
		gaps_out = 12,

		border_size = 0,
	},

	decoration = {
		rounding = 4,
		rounding_power = 0,

		active_opacity = 1,
		inactive_opacity = 1,

		blur = {
			enabled = true,
			size = 4,
			passes = 2,
			vibrancy = 1
		},

		glow = { enabled = false },
		shadow = { enabled = false },
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 1, -- 0=off 1=on 2=fullscreen only 3=fullscreen with video/game
		font_family = 'JetBrainsMono Nerd Font',
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
