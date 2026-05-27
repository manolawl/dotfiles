hl.config({
	general = {
		allow_tearing = true,

		gaps_in = { top = 4, right = 8, bottom = 4, left = 8 },
		gaps_out = { top = 0, right = 16, bottom = 8, left = 16 },

		border_size = 4,
		col = { active_border = 'rgb(71ffd7)', inactive_border = 'rgb(26705c)' }
	},

	decoration = {
		rounding = 4,
		rounding_power = 2,

		active_opacity = 1,
		inactive_opacity = 1,

		blur = {
			enabled = true,
			size = 8,
			passes = 2,
			vibrancy = 1
		},

		shadow = {
			enabled = true,
			offset = { 4, 4 },
			range = 4,
			render_power = 1,
			color = 'rgba(202020bf)'
		},

		glow = { enabled = false },
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
