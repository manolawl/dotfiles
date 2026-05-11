hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape", -- maps caps lock to escape
		kb_rules = "",
		accel_profile = "flat", -- no mouse acceleration
		follow_mouse = 1, -- focus always follows mouse
		repeat_delay = 250, -- milliseconds
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.5,
		},
	},

	cursor = {
		default_monitor = "eDP-1",
		no_hardware_cursors = 1 -- always
	}
})

local terminal = "kitty"
local browser = "zen-browser"
local file_manager = "kitty yazi"
local app_launcher = "rofi -show drun"
local system_monitor = "kitty btop"

-- MAIN PROGRAMS
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + space", hl.dsp.exec_cmd(app_launcher))
hl.bind("XF86Presentation", hl.dsp.exec_cmd(system_monitor))
hl.bind("SUPER + C", hl.dsp.exec_cmd("hyprpicker"))
hl.bind("print", hl.dsp.exec_cmd("grim -t png -g $(slurp)"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))

hl.bind("SUPER + SHIFT + F", hl.dsp.window.float({ action = toggle }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = toggle }))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + Escape", hl.dsp.exec_cmd("hyprlock"))

-- CHANGE WINDOW FOCUS (VIM MOTIONS)
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

-- SWAP/MOVE WINDOW 
hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))

hl.bind("SUPER + CONTROL + J", hl.dsp.window.move({ workspace = 1, follow = true }))
hl.bind("SUPER + CONTROL + K", hl.dsp.window.move({ workspace = 2, follow = true }))

hl.bind("SUPER + CONTROL + L", hl.dsp.layout("colresize +" .. 1/3))
hl.bind("SUPER + CONTROL + H", hl.dsp.layout("colresize -" .. 1/3))
hl.bind("SUPER + comma", hl.dsp.layout("consume"))
hl.bind("SUPER + period", hl.dsp.layout("expel"))

hl.bind("SUPER + F1", hl.dsp.exec_cmd("~/.config/scripts/gamemode.sh"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("~/.config/scripts/reload.sh"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 25%+ && ddcutil setvcp 10 + 25 --noverify --sleep-multiplier=0.2"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 25%- && ddcutil setvcp 10 - 25 --noverify --sleep-multiplier=0.2"))
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 100% && ddcutil setvcp 10 100 --noverify --sleep-multiplier=0.2"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 0% && ddcutil setvcp 10 0 --noverify --sleep-multiplier=0.2"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
