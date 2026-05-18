hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape", -- maps caps lock to escape
		kb_rules = "",
		accel_profile = "flat", -- no mouse acceleration
		follow_mouse = 1, -- focus always follows mouse
		repeat_delay = 200, -- milliseconds
		sensitivity = 0,
		touchpad = {
			natural_scroll = true, -- scrolls opposite to finger swipe
			scroll_factor = 0.5,
		},
	},

	cursor = {
		default_monitor = "eDP-1",
		no_hardware_cursors = 1 -- always true
	}
})

local terminal = "kitty"
local browser = "zen-browser"
local file_manager = "kitty yazi"
local app_launcher = "rofi -show drun"
local system_monitor = "kitty btop"
local screenshot = "hyprshot -m region -o ~/pictures/screenshots"

hl.bind("SUPER + SHIFT + F23", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + space", hl.dsp.exec_cmd(app_launcher))
hl.bind("XF86Presentation", hl.dsp.exec_cmd(system_monitor))
hl.bind("SUPER + C", hl.dsp.exec_cmd("hyprpicker -a -f hex -n -u 256 -s 10"))
hl.bind("print", hl.dsp.exec_cmd(screenshot))
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))

hl.bind("SUPER + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + Escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("~/.config/scripts/gamemode.sh"))

hl.bind("SUPER + R", function()
	hl.exec_cmd("hyprctl reload")
	hl.exec_cmd("pkill waybar; pkill swaybg")
	hl.exec_cmd("kill $(pgrep -f walls_shuffler.sh)")
	hl.exec_cmd("sleep 0.25")
	hl.exec_cmd("waybar")
end)

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + bracketright", hl.dsp.layout("colresize +" .. 1/3))
hl.bind("SUPER + bracketleft", hl.dsp.layout("colresize -" .. 1/3))
hl.bind("SUPER + comma", hl.dsp.layout("consume"))
hl.bind("SUPER + period", hl.dsp.layout("expel"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 25%+ && ddcutil setvcp 10 + 25 --noverify --sleep-multiplier=0.2"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 25%- && ddcutil setvcp 10 - 25 --noverify --sleep-multiplier=0.2"))
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 100% && ddcutil setvcp 10 100 --noverify --sleep-multiplier=0.2"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 0% && ddcutil setvcp 10 0 --noverify --sleep-multiplier=0.2"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
