hl.window_rule({
	name = 'suppress_maximize_events',
	match = { class = '.*' },
	suppress_event = 'maximize',
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

hl.window_rule({ match = { workspace = 'special:gaming', float = false }, fullscreen = true, confine_pointer = true })

hl.window_rule({ match = { class = 'wev' }, float = true })
hl.window_rule({ match = { class = 'hyprland-share-picker' }, float = true })
hl.window_rule({ match = { class = 'org.inkscape.Inkscape' }, fullscreen = true, })
hl.window_rule({ match = { class = 'steam', }, workspace = 'special:gaming' })

-- BLURRING
hl.layer_rule({ match = { namespace = '.*' }, blur = true, blur_popups = true, ignore_alpha = 0.2, })
