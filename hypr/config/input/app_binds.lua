local APP_MOD =        'SUPER + '
local MENU_MOD =       'ALT + '
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
EMOJI_PICKER =         'rofi -modi emoji -show emoji'

local programs = {
	terminal =    { id = TERMINAL,     key = 'T' },
	browser =     { id = BROWSER,      key = 'B' },
	fileManager = { id = FILE_MANAGER, key = 'F' },
	sysMonitor =  { id = SYS_MONITOR,  key = 'M' },
	colPicker =   { id = COL_PICKER,   key = 'C' },
} for _, program in pairs(programs) do
	hl.bind(APP_MOD .. program.key, hl.dsp.exec_cmd(program.id))
end

local menus = {
	clipboard =   { id = CLIPBOARD,    key = 'V' },
	appLauncher = { id = APP_LAUNCHER, key = 'Space' },
	winSelector = { id = WIN_SELECTOR, key = 'Tab' },
	emojiPicker = { id = EMOJI_PICKER, key = 'E' },
} for _, menu in pairs(menus) do
	hl.bind(MENU_MOD .. menu.key, hl.dsp.exec_cmd(menu.id))
end

-- -- >> screenshotting
hl.bind('Print',         hl.dsp.exec_cmd(SCREENSHOT_WIN), { long_press = true })
hl.bind('SHIFT + Print', hl.dsp.exec_cmd(SCREENSHOT_REG))
