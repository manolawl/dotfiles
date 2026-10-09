local appMod =    'SUPER + '
local menuMod =   'ALT + '

local terminal =    'kitty'
local browser =     'zen-browser'
local fileManager = 'pkill yazi || kitty yazi'

local systemMonitor = 'pkill btop || kitty btop'
local calendar =      'pkill calcurse || kitty calcurse'
local audio =         'pkill wiremix || kitty wiremix -v output'
local network =       'pkill impala || kitty impala'
local bluetooth =     'pkill bluetui || kitty bluetui'

local bar = 'pkill waybar || waybar'

local clipboard =      'cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy'
local launcher =       'rofi -show drun'
local windowSelector = 'rofi -show window'
local emojiPicker =    'rofi -_i emoji -show emoji'

local screenshotRegion = 'hyprshot -m region -o ~/pictures/screenshots'
local screenshotWindow = 'hyprshot -m window -o ~/pictures/screenshots'
local colorPicker =      'hyprpicker -a -f hex -n -u 256 -s 10'

-- -- >> LAUNCHING PROGRAMS
local programs = {
	{ cmd = terminal,    keybind = appMod .. 'T' },
	{ cmd = browser,     keybind = appMod .. 'B' },
	{ cmd = fileManager, keybind = appMod .. 'F', floating = true },

	{ cmd = systemMonitor, keybind = appMod .. 'M', floating = true },
	{ cmd = calendar,      keybind = appMod .. 'C', floating = true },
	{ cmd = network,       keybind = appMod .. 'N', floating = true },
	{ cmd = bluetooth,     keybind = appMod .. '1', floating = true },
	{ cmd = audio,         keybind = appMod .. '2', floating = true },

	{ cmd = bar, keybind = appMod .. 'W' },

	{ cmd = clipboard,      keybind = menuMod .. 'V' },
	{ cmd = launcher,       keybind = menuMod .. 'Space' },
	{ cmd = windowSelector, keybind = menuMod .. 'Tab' },
	{ cmd = emojiPicker,    keybind = menuMod .. 'E' },

	{ cmd = screenshotRegion, keybind = 'Print' },
	{ cmd = screenshotWindow, keybind = 'SHIFT + Print' },
	{ cmd = colorPicker,      keybind = 'CTRL + SHIFT + ALT + C' },

}
for _, program in ipairs(programs) do
	local rule = {}
	if program.floating then
		rule = { floating = true, size = {'monitor_w * 0.6', 'monitor_h * 0.5'} }
	end
	hl.bind(program.keybind, hl.dsp.exec_cmd(program.cmd, rule))
end
