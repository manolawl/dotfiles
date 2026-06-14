local TERMINAL =       'kitty'
local BROWSER =        'zen-browser'
local FILE_MANAGER =   'kitty yazi'
local SYS_MONITOR =    'kitty btop'

local SCREENSHOT_REG = 'hyprshot -m region -o ~/pictures/screenshots'
local SCREENSHOT_WIN = 'hyprshot -m window -o ~/pictures/screenshots'
local COL_PICKER =     'hyprpicker -a -f hex -n -u 256 -s 10'

local CLIPBOARD =      'cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy'
local APP_LAUNCHER =   'rofi -show drun'
local WIN_SELECTOR =   'rofi -show window'
local EMOJI_PICKER =   'rofi -modi emoji -show emoji'


-- ROFI
hl.bind('ALT + Space', hl.dsp.exec_cmd(APP_LAUNCHER))
hl.bind('ALT + E',     hl.dsp.exec_cmd(EMOJI_PICKER))
hl.bind('ALT + Tab',   hl.dsp.exec_cmd(WIN_SELECTOR))
hl.bind('ALT + V',     hl.dsp.exec_cmd(CLIPBOARD))


-- WAYBAR
hl.bind('SUPER + 1', hl.dsp.exec_cmd('pkill waybar || waybar -s ~/.config/waybar/style_1.css'))
hl.bind('SUPER + 2', hl.dsp.exec_cmd('pkill waybar || waybar -s ~/.config/waybar/style_2.css'))


-- SYSTEM SCREENSHOT
hl.bind('Print',         hl.dsp.exec_cmd(SCREENSHOT_WIN), { long_press = true })
hl.bind('SHIFT + Print', hl.dsp.exec_cmd(SCREENSHOT_REG))


-- APPS
hl.bind('SUPER + M', hl.dsp.exec_cmd(SYS_MONITOR))
hl.bind('SUPER + T', hl.dsp.exec_cmd(TERMINAL))
hl.bind('SUPER + B', hl.dsp.exec_cmd(BROWSER))
hl.bind('SUPER + F', hl.dsp.exec_cmd(FILE_MANAGER))
hl.bind('SUPER + C', hl.dsp.exec_cmd(COL_PICKER))
