hl.window_rule({
	name =           'suppress_maximize_events',
	match =          { class = '.*' },
	suppress_event = 'maximize',
})

hl.window_rule({
	name =             'fix_xwayland_drags',
	no_initial_focus = true,
	match = {
		class =      '^$',
		title =      '^$',
		xwayland =   true,
		float =      true,
		fullscreen = false,
		pin =        false,
	},
})

hl.window_rule({ match = { workspace = 'special:gaming', float = true }, fullscreen = false, confine_pointer = false })

hl.window_rule({ match = { class = 'wev' }, float = true })
hl.window_rule({ match = { class = 'hyprland-share-picker' }, float = true })
hl.window_rule({
	match = { title = 'Picture-in-Picture' },
	float = true,
	pin = true,
	size = { "monitor_w *  0.25", "monitor_h * 0.25" },
	move = { "monitor_w * 0.74", "monitor_h * 0.73" }
})
hl.window_rule({ match = { class = 'steam', }, workspace = 'special:gaming' })
hl.window_rule({ match = { title = 'Steam', }, workspace = 'special:gaming' })

-- BLURRING
--hl.layer_rule({ match = { namespace = '.*' }, blur = true, blur_popups = true, ignore_alpha = 0.2, })
