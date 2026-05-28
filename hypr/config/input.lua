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
local terminal = 'kitty'
local browser = 'zen-browser'
local file_manager = 'kitty yazi'
local system_monitor = 'kitty btop'
local screenshot_region = 'hyprshot -m region -o ~/pictures/screenshots'
local screenshot_window = 'hyprshot -m window -o ~/pictures/screenshots'
local clipboard = 'cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy'
local color_picker = 'hyprpicker -a -f hex -n -u 256 -s 10'
local app_launcher = 'rofi -show drun'
local window_selector = 'rofi -show window'
local emoji_picker = 'rofi -modi emoji -show emoji'

local window_offset = 32

local left_click = 'mouse:272'
local right_click = 'mouse:273'
local side_front = 'mouse:276'
local side_back = 'mouse:275'



local function backlight(sign, val)
	hl.exec_cmd('\
		brightnessctl set ' ..val.. '%' ..sign.. ' &&\
		ddcutil setvcp 10 ' ..sign.. ' ' ..val.. ' --noverify --sleep-multiplier=0.2\
	')
end

local function toggle_layout(layout)
	if hl.get_config('general.layout') == layout then
		hl.exec_cmd('hyprctl reload')
	end

	hl.config({ general = { layout = layout } })
end



--hl.bind('tablet:1', hl.dsp.exec_cmd('notify-send tab1'))



-- ROFI
hl.bind('ALT + Space', hl.dsp.exec_cmd(app_launcher))
hl.bind('ALT + E', hl.dsp.exec_cmd(emoji_picker))
hl.bind('ALT + Tab', hl.dsp.exec_cmd(window_selector))
hl.bind('ALT + V', hl.dsp.exec_cmd(clipboard))



-- WAYBAR
hl.bind('SUPER + 1', hl.dsp.exec_cmd('pkill waybar || waybar -s ~/.config/waybar/style_1.css'))
hl.bind('SUPER + 2', hl.dsp.exec_cmd('pkill waybar || waybar -s ~/.config/waybar/style_2.css'))



-- SYSTEM SCREENSHOT
hl.bind('Print', hl.dsp.exec_cmd(screenshot_window), { long_press = true })
hl.bind('SHIFT + Print', hl.dsp.exec_cmd(screenshot_region))



-- APPS
hl.bind('SUPER + SHIFT + F23', hl.dsp.exec_cmd(terminal)) -- copilot key
hl.bind('XF86Presentation', hl.dsp.exec_cmd(system_monitor), { long_press = true })
hl.bind('SUPER + B', hl.dsp.exec_cmd(browser))
hl.bind('SUPER + F', hl.dsp.exec_cmd(file_manager))
hl.bind('SUPER + C', hl.dsp.exec_cmd(color_picker))



-- WINDOW ACTIONS (macOS-like window decorations?)
hl.bind('SUPER + Q', hl.dsp.window.close())
hl.bind('F11', hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind('SHIFT + F11', hl.dsp.window.float({ action = 'toggle' }))



-- FOCUS ON ADJACENT WINDOW
hl.bind('SUPER + H', hl.dsp.focus({ direction = 'left' }), { repeating = true })
hl.bind('SUPER + J', hl.dsp.focus({ direction = 'down' }), { repeating = true })
hl.bind('SUPER + K', hl.dsp.focus({ direction = 'up' }), { repeating = true })
hl.bind('SUPER + L', hl.dsp.focus({ direction = 'right' }), { repeating = true })
-- MOUSE
hl.bind('SUPER + ' ..left_click, hl.dsp.focus({ direction = 'left' }), { mouse = true, release = true })
hl.bind('SUPER + ' ..side_back, hl.dsp.focus({ direction = 'down' }), { mouse = true, release = true })
hl.bind('SUPER + ' ..side_front, hl.dsp.focus({ direction = 'up' }), { mouse = true, release = true })
hl.bind('SUPER + ' ..right_click, hl.dsp.focus({ direction = 'right' }), { mouse = true, release = true })



-- MOVE TILED WINDOW
hl.bind('SUPER + CTRL + H', hl.dsp.window.move({ direction = 'left' }))
hl.bind('SUPER + CTRL + J', hl.dsp.window.move({ direction = 'down' }))
hl.bind('SUPER + CTRL + K', hl.dsp.window.move({ direction = 'up' }))
hl.bind('SUPER + CTRL + L', hl.dsp.window.move({ direction = 'right' }))
-- MOUSE
hl.bind('SUPER + CTRL + ' ..left_click, hl.dsp.window.move({ direction = 'left' }), { mouse = true, release = true })
hl.bind('SUPER + CTRL + ' ..side_back, hl.dsp.window.move({ direction = 'down' }), { mouse = true, release = true })
hl.bind('SUPER + CTRL + ' ..side_front, hl.dsp.window.move({ direction = 'up' }), { mouse = true, release = true })
hl.bind('SUPER + CTRL + ' ..right_click,hl.dsp.window.move({ direction = 'right' }, { mouse = true, release = true }))



-- MOVE FLOATING WINDOW
hl.bind('CTRL + SHIFT + H', hl.dsp.window.move({ x = -window_offset, y = 0, relative = true }), { repeating = true })
hl.bind('CTRL + SHIFT + J', hl.dsp.window.move({ x = 0, y = window_offset, relative = true }), { repeating = true })
hl.bind('CTRL + SHIFT + K', hl.dsp.window.move({ x = 0, y = -window_offset, relative = true }), { repeating = true })
hl.bind('CTRL + SHIFT + L', hl.dsp.window.move({ x = window_offset, y = 0, relative = true }), { repeating = true })
-- MOUSE
hl.bind('CTRL + ' ..left_click, hl.dsp.window.drag(), { mouse = true })
hl.bind('CTRL + SHIFT + ' ..left_click, hl.dsp.window.move({ x = -window_offset, y = 0, relative = true }), { mouse = true, repeating = true })
hl.bind('CTRL + SHIFT + ' ..side_back, hl.dsp.window.move({ x = 0, y = window_offset, relative = true }), { mouse = true, repeating = true })
hl.bind('CTRL + SHIFT + ' ..side_front, hl.dsp.window.move({ x = 0, y = -window_offset, relative = true }), { mouse = true, repeating = true })
hl.bind('CTRL + SHIFT + ' ..right_click, hl.dsp.window.move({ x = window_offset, y = 0, relative = true }), { mouse = true, repeating = true })



-- RESIZE WINDOWS
hl.bind('ALT + SHIFT + H', hl.dsp.window.resize({ x = -window_offset, y = 0, relative = true }), { repeating = true })
hl.bind('ALT + SHIFT + J', hl.dsp.window.resize({ x = 0, y = -window_offset, relative = true }), { repeating = true })
hl.bind('ALT + SHIFT + K', hl.dsp.window.resize({ x = 0, y = window_offset, relative = true }), { repeating = true })
hl.bind('ALT + SHIFT + L', hl.dsp.window.resize({ x = window_offset, y = 0, relative = true }), { repeating = true })
--MOUSE
hl.bind('ALT + ' ..left_click, hl.dsp.window.resize(), { mouse = true })
hl.bind('ALT + SHIFT + ' ..left_click, hl.dsp.window.resize({ x = -window_offset, y = 0, relative = true }), { mouse = true, repeating = true })
hl.bind('ALT + SHIFT + ' ..side_back, hl.dsp.window.resize({ x = 0, y = -window_offset, relative = true }), { mouse = true, repeating = true })
hl.bind('ALT + SHIFT + ' ..side_front, hl.dsp.window.resize({ x = 0, y = window_offset, relative = true }), { mouse = true, repeating = true })
hl.bind('ALT + SHIFT + ' ..right_click, hl.dsp.window.resize({ x = window_offset, y = 0, relative = true }), { mouse = true, repeating = true })



-- FOCUS ON ADJACENT WORKSPACE
hl.bind('SUPER + semicolon', hl.dsp.focus({ workspace = '-1' }), { repeating = true })
hl.bind('SUPER + apostrophe', hl.dsp.focus({ workspace = '+1' }), { repeating = true })
hl.bind('SUPER + mouse_down', hl.dsp.focus({ workspace = '-1' }))
hl.bind('SUPER + mouse_up', hl.dsp.focus({ workspace = '+1' }))
hl.gesture({ fingers = 3, direction = 'vertical', action = 'workspace' })



-- MOVE WINDOW TO ADJACENT WORKSPACE
hl.bind('SUPER + CTRL + semicolon', hl.dsp.window.move({ workspace = '-1' }))
hl.bind('SUPER + CTRL + apostrophe', hl.dsp.window.move({ workspace = '+1' }))
hl.bind('SUPER + CTRL + mouse_down', hl.dsp.window.move({ workspace = '-1' }))
hl.bind('SUPER + CTRL + mouse_up', hl.dsp.window.move({ workspace = '+1' }))



-- SPECIAL WORKSPACES
hl.bind('SUPER + G', hl.dsp.workspace.toggle_special('gaming'))



-- LAYOUTS
hl.bind('SUPER + SHIFT + D', function() toggle_layout('dwindle') end)
hl.bind('SUPER + SHIFT + M', function() toggle_layout('master') end)



-- LAYOUT SPECIFIC SIZING
hl.bind('SUPER + bracketleft', function()
	if hl.get_config('general.layout') == 'scrolling' then
		hl.dispatch(hl.dsp.layout('colresize -' .. 1/3))
	end

	if hl.get_config('general.layout') == 'dwindle' then
		hl.dispatch(hl.dsp.layout('splitratio -' .. 1/16))
	end
end)

hl.bind('SUPER + bracketright', function()
	if hl.get_config('general.layout') == 'scrolling' then
		hl.dispatch(hl.dsp.layout('colresize +' .. 1/3))
	end

	if hl.get_config('general.layout') == 'dwindle' then
		hl.dispatch(hl.dsp.layout('splitratio +' .. 1/16))
	end
end)



-- DWINDLE SPECIFIC
hl.bind('SUPER + P', hl.dsp.window.pseudo())
hl.bind('SUPER + S', hl.dsp.layout('togglesplit'))



-- SCROLLING SPECIFIC
hl.bind('SUPER + comma', hl.dsp.layout('consume'))
hl.bind('SUPER + period', hl.dsp.layout('expel'))
hl.gesture({ fingers = 3, direction = 'horizontal', action = 'scroll_move' })



-- BACKLIGHT
hl.bind('XF86MonBrightnessUp', function() backlight('+', 25) end)
hl.bind('XF86MonBrightnessDown', function() backlight('-', 25) end)
hl.bind('SHIFT + XF86MonBrightnessUp', function() backlight('', 100) end)
hl.bind('SHIFT + XF86MonBrightnessDown', function() backlight('', 0) end)



-- AUDIO
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'), { repeating = true })
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'), { repeating = true })
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'))
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'))
