hl.config({
	general = {
		layout = scrolling
		gaps_in = 4,
		gaps_out = 8,
		border_size = 2,
		resize_on_border = false,
		allow_tearing = true,

		col = {
			inactive_border = "rgba(000000bf)",
			active_border = {
				angle = 0,
				colors = {
					"rgba(000000bf)",
					"rgb(e240f9)",
					"rgb(e24074)",
					"rgb(e29074)",
					"rgb(97df74)",
					"rgb(4bdf74)",
					"rgb(4bdff9)",
					"rgb(4b90f9)",
					"rgb(9740f9)",
					"rgba(000000bf)"
				}
			},
		}
	},

	dwindle = {
		pseudotile = true,
	},
	scrolling = {
		fullscreen_on_one_column = true,
		focus_fit_method = 0,
		column_width = 0.666666666,
		direction = right,
	},
})
