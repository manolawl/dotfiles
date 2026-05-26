local terminal = 'kitty'
local browser = 'zen-browser'
local file_manager = 'kitty yazi'
local app_launcher = 'rofi -show drun'
local system_monitor = 'kitty btop'
local screenshot_region = 'hyprshot -m region -o ~/pictures/screenshots'
local screenshot_window = 'hyprshot -m window -o ~/pictures/screenshots'
local clipboard = 'cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy'
local color_picker = 'hyprpicker -a -f hex -n -u 256 -s 10'
local emoji_picker = 'rofi -modi emoji -show emoji'

local function shell_reload()
	hl.exec_cmd('\
		hyprctl reload\
		swaync-client -rs -R\
		pkill waybar\
		waybar\
	')
end

local function backlight(sign, val)
	hl.exec_cmd('\
		brightnessctl set ' ..val.. '%' ..sign.. ' &&\
		ddcutil setvcp 10 ' ..sign.. ' ' ..val.. ' --noverify --sleep-multiplier=0.2\
	')
end

local function toggle_minim()
	-- TOGGLE OFF
	if hl.get_config('animations.enabled') == false then
		hl.exec_cmd('\
		hyprctl reload\
		pkill waybar\
		waybar\
		')
	end

	-- TOGGLE ON
	hl.config({
		general = {
			border_size = 2,
			layout = 'dwindle',
			gaps_in = 4,
			gaps_out = 8
		},
		animations = {enabled = false },
		decoration = {
			rounding = 0,
			blur = { enabled = false },
			shadow = { enabled = false }
		}
	})

	hl.exec_cmd('\
		pkill waybar\
		waybar -s ~/.config/waybar/minim.css -c ~/.config/waybar/minim.json\
	')
end

hl.config({
	input = {
		kb_layout = 'us',
		kb_variant = '',
		kb_model = '',
		kb_options = 'caps:escape', -- maps caps lock to escape
		kb_rules = '',
		accel_profile = 'flat', -- no mouse acceleration
		follow_mouse = 1, -- focus always follows mouse
		repeat_delay = 200, -- milliseconds
		repeat_rate = 50,
		sensitivity = 0, -- [-1, 1]
		touchpad = {
			natural_scroll = true, -- scrolls opposite to finger swipe
			scroll_factor = 0.75,
		},
	},

	cursor = {
		default_monitor = 'eDP-1',
		no_hardware_cursors = 1 -- always true
	}
})

hl.device({
	name = 'pixa3848:00-093a:3848-touchpad',
	sensitivity = 1
})


hl.gesture({ fingers = 3, direction = 'vertical', action = 'workspace' })
hl.gesture({ fingers = 3, direction = 'horizontal', action = 'scroll_move' })

hl.bind('Menu', function()
	if hl.get_config('animations.enabled') == false then
		hl.exec_cmd(app_launcher .. ' -config ~/.config/rofi/minim.rasi')
	else
		hl.exec_cmd(app_launcher)
	end
end)

hl.bind('SUPER + SHIFT + F23', hl.dsp.exec_cmd(terminal), { long_press = true }) -- copilot
hl.bind('SUPER + B', hl.dsp.exec_cmd(browser))
hl.bind('SUPER + F', hl.dsp.exec_cmd(file_manager))
hl.bind('SUPER + E', hl.dsp.exec_cmd(emoji_picker))
hl.bind('XF86Presentation', hl.dsp.exec_cmd(system_monitor), { long_press = true })
hl.bind('SUPER + C', hl.dsp.exec_cmd(color_picker))
hl.bind('Print', hl.dsp.exec_cmd(screenshot_window), { long_press = true })
hl.bind('SHIFT + Print', hl.dsp.exec_cmd(screenshot_region))
hl.bind('SUPER + V', hl.dsp.exec_cmd(clipboard))
hl.bind('SUPER + W', hl.dsp.exec_cmd('pkill waybar || waybar'))

hl.bind('SUPER + Space', hl.dsp.window.float({ action = 'toggle' }))
hl.bind('ALT + Space', hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind('SUPER + Q', hl.dsp.window.close())
hl.bind('SUPER + Escape', hl.dsp.exec_cmd('hyprlock'))

hl.bind('SUPER + M', toggle_minim)
hl.bind('SUPER + R', shell_reload)

hl.bind('SUPER + H', hl.dsp.focus({ direction = 'left' }), { repeating = true })
hl.bind('SUPER + J', hl.dsp.focus({ direction = 'down' }), { repeating = true })
hl.bind('SUPER + K', hl.dsp.focus({ direction = 'up' }), { repeating = true })
hl.bind('SUPER + L', hl.dsp.focus({ direction = 'right' }), { repeating = true })

hl.bind('SUPER + Return', hl.dsp.focus({ workspace = '+1' }), { repeating = true })
hl.bind('SUPER + BackSpace', hl.dsp.focus({ workspace = '-1' }), { repeating = true })

hl.bind('SUPER + CTRL + H', hl.dsp.window.move({ direction = 'left' }))
hl.bind('SUPER + CTRL + J', hl.dsp.window.move({ direction = 'down' }))
hl.bind('SUPER + CTRL + K', hl.dsp.window.move({ direction = 'up' }))
hl.bind('SUPER + CTRL + L', hl.dsp.window.move({ direction = 'right' }))

hl.bind('SUPER + CTRL + Return', hl.dsp.window.move({ workspace = '+1' }))
hl.bind('SUPER + CTRL + BackSpace', hl.dsp.window.move({ workspace = '-1' }))

hl.bind('SUPER + SHIFT + H', hl.dsp.window.swap({ direction = 'left' }))
hl.bind('SUPER + SHIFT + J', hl.dsp.window.swap({ direction = 'down' }))
hl.bind('SUPER + SHIFT + K', hl.dsp.window.swap({ direction = 'up' }))
hl.bind('SUPER + SHIFT + L', hl.dsp.window.swap({ direction = 'right' }))

hl.bind('SUPER + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind('SUPER + mouse:273', hl.dsp.window.resize(), { mouse = true })

hl.bind('SUPER + bracketright', hl.dsp.layout('colresize +' .. 1/2))
hl.bind('SUPER + bracketleft', hl.dsp.layout('colresize -' .. 1/2))
hl.bind('SUPER + comma', hl.dsp.layout('consume'))
hl.bind('SUPER + period', hl.dsp.layout('expel'))

hl.bind('XF86MonBrightnessUp', function() backlight('+', 25) end)
hl.bind('XF86MonBrightnessDown', function() backlight('-', 25) end)
hl.bind('SHIFT + XF86MonBrightnessUp', function() backlight('', 100) end)
hl.bind('SHIFT + XF86MonBrightnessDown', function() backlight('', 0) end)

hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'), { repeating = true })
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'), { repeating = true })
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'))
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'))
