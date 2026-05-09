hl.window_rule({
	name = "suppress_maximize_events",
	match = { class = ".*" },
	suppress_event = "maximize"
})

hl.window_rule({
	name = "fix_xwayland_drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_initial_focus = true
})

hl.window_rule({
	name = "wev_float",
	match = { class = "wev" },
	float = true,
})

hl.layer_rule({
	name = "waybar_blur",
	match = { namespace = "main" },
	blur = true,
	ignore_alpha = 0.2,
})

hl.layer_rule({
	name = "swaync_blur",
	match = { namespace = "swaync-control-center" },
	blur = true,
	ignore_alpha = 0.2,
})

