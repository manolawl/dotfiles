local APP_MOD =  'SUPER + '
local MENU_MOD = 'ALT + '

local TERMINAL =     'kitty'
local BROWSER =      'zen-browser'
local FILE_MANAGER = 'kitty yazi'
local SYS_MONITOR =  'kitty btop'

local COL_PICKER =   'hyprpicker -a -f hex -n -u 256 -s 10'
local CLIPBOARD =    'cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy'
local APP_LAUNCHER = 'rofi -show drun'
local WIN_SELECTOR = 'rofi -show window'
EMOJI_PICKER =       'rofi -modi emoji -show emoji'

local SCREENSHOT_REG = 'hyprshot -m region -o ~/pictures/screenshots'
local SCREENSHOT_WIN = 'hyprshot -m window -o ~/pictures/screenshots'

-- -- >> LAUNCHING APPS
local apps = {
	terminal =    { launch_cmd = TERMINAL,     key = 'T' },
	browser =     { launch_cmd = BROWSER,      key = 'B' },
	fileManager = { launch_cmd = FILE_MANAGER, key = 'F' },
	sysMonitor =  { launch_cmd = SYS_MONITOR,  key = 'M' },
	colPicker =   { launch_cmd = COL_PICKER,   key = 'C' },
} for _, app in pairs(apps) do
	hl.bind(APP_MOD .. app.key, hl.dsp.exec_cmd(app.launch_cmd))
end

-- -- >> OPENING MENUS
local menus = {
	clipboard =   { launch_cmd = CLIPBOARD,    key = 'V' },
	appLauncher = { launch_cmd = APP_LAUNCHER, key = 'Space' },
	winSelector = { launch_cmd = WIN_SELECTOR, key = 'Tab' },
	emojiPicker = { launch_cmd = EMOJI_PICKER, key = 'E' },
} for _, menu in pairs(menus) do
	hl.bind(MENU_MOD .. menu.key, hl.dsp.exec_cmd(menu.launch_cmd))
end

-- -- >> SCREENSHOTS
hl.bind('Print',         hl.dsp.exec_cmd(SCREENSHOT_WIN), { long_press = true })
hl.bind('SHIFT + Print', hl.dsp.exec_cmd(SCREENSHOT_REG))
