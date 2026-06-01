local terminal = 'kitty'
local browser = 'zen-browser'
local file_manager = 'kitty yazi'
local system_monitor = 'kitty btop'

local screenshot_region = 'hyprshot -m region -o ~/pictures/screenshots'
local screenshot_window = 'hyprshot -m window -o ~/pictures/screenshots'
local color_picker = 'hyprpicker -a -f hex -n -u 256 -s 10'

local clipboard = 'cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy'
local app_launcher = 'rofi -show drun'
local window_selector = 'rofi -show window'
local emoji_picker = 'rofi -modi emoji -show emoji'
local power_menu = "printf 'systemctl suspend\nhyprshutdown\nhyprshutdown --post-cmd reboot\nhyprshutdown --post-cmd \"shutdown now\"' | rofi -dmenu | $SHELL"



-- ROFI
hl.bind('ALT + Space', hl.dsp.exec_cmd(app_launcher))
hl.bind('ALT + E', hl.dsp.exec_cmd(emoji_picker))
hl.bind('ALT + Tab', hl.dsp.exec_cmd(window_selector))
hl.bind('ALT + V', hl.dsp.exec_cmd(clipboard))
hl.bind('ALT + P', hl.dsp.exec_cmd(power_menu))



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
