local APP__ =    'SUPER + '
local MENU__ =   'ALT + '
local TOGGLE__ = 'CTRL + ALT + '

local TERMINAL =   'kitty'
local BROWSER =    'zen-browser'
local FILE_MAN =   'kitty yazi'
local COL_PICKER = 'hyprpicker -a -f hex -n -u 256 -s 10'
local SYS_MON = 'pkill btop || kitty btop'
local BAR =     'pkill waybar || waybar'
local CLIPBOARD =    'cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy'
local LAUNCHER =     'rofi -show drun'
local WIN_SELECTOR = 'rofi -show window'
EMOJI_PICKER =       'rofi -_i emoji -show emoji'
local SS_REG = 'hyprshot -m region -o ~/pictures/screenshots'
local SS_WIN = 'hyprshot -m window -o ~/pictures/screenshots'

-- -- >> LAUNCHING PROGRAMS
local programs = {
	{ cmd = TERMINAL,     keybind = APP__ ..    'T' },
	{ cmd = BROWSER,      keybind = APP__ ..    'B' },
	{ cmd = FILE_MAN,     keybind = APP__ ..    'F' },
	{ cmd = COL_PICKER,   keybind = APP__ ..    'C' },
	{ cmd = SYS_MON,      keybind = TOGGLE__ .. 'M' },
	{ cmd = BAR,          keybind = TOGGLE__ .. 'W' },
	{ cmd = CLIPBOARD,    keybind = MENU__ ..   'V' },
	{ cmd = LAUNCHER,     keybind = MENU__ ..   'Space' },
	{ cmd = WIN_SELECTOR, keybind = MENU__ ..   'Tab' },
	{ cmd = EMOJI_PICKER, keybind = MENU__ ..   'E' },
	{ cmd = SS_REG,       keybind = 'Print' },
	{ cmd = SS_WIN,       keybind = 'SHIFT + Print' },
}
for _, program in ipairs(programs) do
	hl.bind(program.keybind, hl.dsp.exec_cmd(program.cmd))
end
