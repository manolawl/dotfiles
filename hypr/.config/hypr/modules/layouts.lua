hl.config({
	general = {
		layout = "scrolling",
		gaps_in = { top = 4, bottom = 4, left = 8, right = 8 },
		gaps_out = { top = 0, bottom = 0, left = 16, right = 16 },
		border_size = 0,
		resize_on_border = false,
		allow_tearing = true,

		col = {
			inactive_border = "rgba(000000bf)",
			active_border = "rgba(000000bf)"  --[[{
				angle = 0,
				colors = {
					"rgba(000000bf)",
					"rgba(e240f9ff)",
					"rgba(e24074ff)",
					"rgba(e29074ff)",
					"rgba(97df74ff)",
					"rgba(4bdf74ff)",
					"rgba(4bdff9ff)",
					"rgba(4b90f9ff)",
					"rgba(9740f9ff)",
					"rgba(000000bf)"
				}
			},]]
		}
	},

	decoration = {
		rounding = 4,
		rounding_power = 0,
		active_opacity = 1,
		inactive_opacity = 1,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 2,
			color = "rgb(202020)"
		},

		blur = {
			enabled = true,
			size = 4,
			passes = 2,
			vibrancy = 0
		}
	},

	dwindle = {},

	scrolling = {
		fullscreen_on_one_column = false,
		focus_fit_method = 1, -- 0=center 1=fit
		column_width = 1/3,
		direction = "right",
	},
})
