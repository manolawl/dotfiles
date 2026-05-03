hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape", -- maps caps lock to escape
		kb_rules = "",
		accel_profile = "flat", -- no mouse acceleration
		follow_mouse = 1, -- focus always follows mouse
		repeat_delay = 125,
		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.5,
		},
	},

	cursor = {
		default_monitor = "eDP-1",
		no_hardware_cursors = 1 -- no using hardware cursor
	}
})

-- MAIN PROGRAMS
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + space", hl.dsp.exec_cmd(app_launcher))
hl.bind("XF86Presentation", hl.dsp.exec_cmd(system_monitor))

hl.bind("SUPER + F", hl.dsp.window.float({ action = toggle }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ action = toggle }))
hl.bind("SUPER + Q", hl.dsp.window.kill())
hl.bind("SUPER + Escape", hl.dsp.exec_cmd("hyprlock"))

-- WINDOW FOCUSING
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

