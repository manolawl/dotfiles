hl.window_rule({
	name = 'suppress_maximize_events',
	match = { class = '.*' },
	suppress_event = 'maximize'
})

hl.window_rule({
	name = 'fix_xwayland_drags',
	match = {
		class = '^$',
		title = '^$',
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_initial_focus = true
})

hl.window_rule({
	name = 'wev_float',
	match = { class = 'wev' },
	float = true,
})

hl.window_rule({
	name = 'inkscape_fullscreen',
	match = { class = 'org.inkscape.Inkscape' },
	fullscreen = true
})

hl.window_rule({
	name = 'steam_placement',
	match = { class = 'steam' },
	workspace = '+1'
})

hl.layer_rule({
	name = 'waybar_blur',
	match = { namespace = 'waybar' },
	blur = true,
	blur_popups = true,
	ignore_alpha = 0.2,
})

hl.layer_rule({
	name = 'rofi_blur',
	match = { namespace = 'rofi' },
	blur = true,
	ignore_alpha = 0.2,
})

hl.layer_rule({
	name = 'swaync_blur',
	match = { namespace = 'swaync-control-center' },
	blur = true,
	ignore_alpha = 0.2,
})

hl.layer_rule({
	name = 'notification_blur',
	match = { namespace = 'swaync-notification-window' },
	blur = true,
	ignore_alpha = 0.2,
})
