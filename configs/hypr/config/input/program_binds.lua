local APP_MOD =  'SUPER + '
local MENU_MOD = 'ALT + '
local TOGGLE_MOD = 'CTRL + ALT + '

local TERMINAL =     'kitty'
local BROWSER =      'zen-browser'
local FILE_MANAGER = 'kitty yazi'
local COL_PICKER =   'hyprpicker -a -f hex -n -u 256 -s 10'

local SYS_MONITOR = 'pkill btop || kitty btop'
local BAR =         'pkill waybar || waybar'

local CLIPBOARD =    'cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy'
local APP_LAUNCHER = 'rofi -show drun'
local WIN_SELECTOR = 'rofi -show window'
EMOJI_PICKER =       'rofi -modi emoji -show emoji'

local SCREENSHOT_REG = 'hyprshot -m region -o ~/pictures/screenshots'
local SCREENSHOT_WIN = 'hyprshot -m window -o ~/pictures/screenshots'

-- -- >> LAUNCHING PROGRAMS
local programs = {
	terminal =         { launch_cmd = TERMINAL,       keybind = APP_MOD ..    'T' },
	browser =          { launch_cmd = BROWSER,        keybind = APP_MOD ..    'B' },
	fileManager =      { launch_cmd = FILE_MANAGER,   keybind = APP_MOD ..    'F' },
	colPicker =        { launch_cmd = COL_PICKER,     keybind = APP_MOD ..    'C' },
	sysMonitor =       { launch_cmd = SYS_MONITOR,    keybind = TOGGLE_MOD .. 'M' },
	bar =              { launch_cmd = BAR,            keybind = TOGGLE_MOD .. 'W' },
	clipboard =        { launch_cmd = CLIPBOARD,      keybind = MENU_MOD ..   'V' },
	appLauncher =      { launch_cmd = APP_LAUNCHER,   keybind = MENU_MOD ..   'Space' },
	winSelector =      { launch_cmd = WIN_SELECTOR,   keybind = MENU_MOD ..   'Tab' },
	emojiPicker =      { launch_cmd = EMOJI_PICKER,   keybind = MENU_MOD ..   'E' },
	screenshotRegion = { launch_cmd = SCREENSHOT_REG, keybind = 'Print' },
	screenshotWindow = { launch_cmd = SCREENSHOT_WIN, keybind = 'SHIFT + Print' },
} for _, program in pairs(programs) do
	hl.bind(program.keybind, hl.dsp.exec_cmd(program.launch_cmd))
end
