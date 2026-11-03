hl.config({
	general = {
		allow_tearing = true,
		resize_on_border = false,

		gaps_in =  InnerGap,
		gaps_out = OuterGap,

		border_size = 1,
		col = {
			active_border =   '#e2dff9a6',
			inactive_border = '#71707da6',
		}
	},

	decoration = {
		shadow = { enabled = false },
		glow =   { enabled = false },

		active_opacity =   1,
		inactive_opacity = 1,

		rounding =       RoundValue,
		rounding_power = RoundPower,

		blur = {
			enabled =    true,
			xray =       false,
			size =       BlurSize,
			passes =     BlurPass,
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
		force_default_wallpaper =  0,
	},

	xwayland = {
		enabled =              true,
		force_zero_scaling =   true,
		use_nearest_neighbor = true
	},
})
