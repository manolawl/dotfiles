hl.window_rule({
	name =  'suppress_maximize_events',
	match = { class = '.*' },

	suppress_event = 'maximize',
})

hl.window_rule({
	name = 'fix_xwayland_drags',
	match = {
		class =      '^$',
		title =      '^$',
		xwayland =   true,
		float =      true,
		fullscreen = false,
		pin =        false,
	},

	no_initial_focus = true,
})

hl.window_rule({
	match = { class = 'wev' },

	float = true,
	center = true,
	size = { 'monitor_w * 0.02', 'monitor_w * 0.02' },
})

--screen share
hl.window_rule({ match = { class = 'hyprland-share-picker' }, float = true })

-- zen browser PiP
hl.window_rule({
	match = { title = 'Picture-in-Picture' },
	float = true,
	pin = true,
	size = { 'monitor_w * 0.25', 'monitor_h * 0.25' },
	move = { 'monitor_w * 0.75 - ' .. OuterGap - InnerGap, 'monitor_h * 0.75 - ' .. OuterGap }
})

--file picker
hl.window_rule({
	match = { class = 'xdg-desktop-portal-gtk' },
	float = true,
	size = { 'monitor_w * 0.5', 'monitor_h * 0.5' },
	move = { OuterGap + InnerGap, 'monitor_h * 0.5 - ' .. OuterGap }
})

hl.window_rule({
	match = { title = 'Select file to open' },
	float = true,
	size = { 'monitor_w * 0.5', 'monitor_h * 0.5' },
	move = { OuterGap + InnerGap, OuterGap + 37 }
})

-- -- -- >> STEAM
hl.window_rule({
	match = { workspace = 'special:gaming', },
	confine_pointer = true,
	center = true,
})

hl.workspace_rule({
	workspace = 'special:gaming',
	decorate = false,
	no_rounding = true,
	gaps_in = 0,
	gaps_out = 0,
})
hl.window_rule({ match = { initial_class = 'steam', }, workspace = 'special:gaming', center = true, })
hl.window_rule({ match = { class =         'steam', }, workspace = 'special:gaming', center = true, })
hl.window_rule({ match = { initial_title = 'Steam', }, workspace = 'special:gaming', center = true, })
hl.window_rule({ match = { title =         'Steam', }, workspace = 'special:gaming', center = true, })

-- blur for non-window layers
hl.layer_rule({
	match = { namespace = '.*' },
	blur = true,
	xray = false,
	blur_popups = true,
	ignore_alpha = 0.2,
})

-- disabling visual clutter for screenshot
hl.layer_rule({
	match = { namespace = 'selection' },
	blur = false,
	xray = false,
})

hl.workspace_rule({ workspace = '1', monitor = 'eDP-1' })
hl.workspace_rule({ workspace = '2', monitor = 'eDP-1' })
hl.workspace_rule({ workspace = '3', monitor = 'HDMI-A-2' })
