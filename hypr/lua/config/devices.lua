hl.config({
	input = {
		kb_layout = 'us',
		kb_variant = '',
		kb_model = '',
		kb_options = 'caps:escape', -- maps caps-lock to escape
		kb_rules = '',
		accel_profile = 'flat', -- no mouse acceleration
		follow_mouse = 1, -- focus always follows mouse
		repeat_delay = 200, -- milliseconds
		repeat_rate = 50, -- keys per second
		sensitivity = 0, -- [-1, 1]
		touchpad = {
			natural_scroll = true, -- scrolls opposite to finger swipe
			scroll_factor = 0.75,
		},
	},

	cursor = {
		default_monitor = 'eDP-1', --monitor name
		no_hardware_cursors = 1 -- always true
	}
})

hl.device({
	name = 'pixa3848:00-093a:3848-touchpad',
	sensitivity = 1
})
