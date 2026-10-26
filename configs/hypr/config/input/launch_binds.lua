local AppMod =  'SUPER + '
local MenuMod = 'ALT + '

local Terminal = 'kitty'
local Browser =  'zen-browser'
local FileMan =  'kitty yazi'

local SysMon =       'pkill btop || kitty btop'
local AudioControl = 'pkill wiremix || kitty wiremix -v output'
local Network =      'pkill impala || kitty impala'
local Bluetooth =    'pkill bluetui || kitty bluetui'

local Clipboard =   'cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy'
local Launcher =    'rofi -show drun'

local RegCapture =  'hyprshot -m region -o ~/pictures/screenshots'
local WinCapture =  'hyprshot -m window -o ~/pictures/screenshots'
local ColorPicker = 'hyprpicker -a -f hex -n -u 256 -s 10'

-- -- >> LAUNCHING PROGRAMS
local programs = {
	{ cmd = Terminal, keybind = AppMod .. 'T' },
	{ cmd = Browser,  keybind = AppMod .. 'B' },
	{ cmd = FileMan,  keybind = AppMod .. 'E' },

	{ cmd = Network,      keybind = AppMod .. '1', floating = true },
	{ cmd = Bluetooth,    keybind = AppMod .. '2', floating = true },
	{ cmd = AudioControl, keybind = AppMod .. '3', floating = true },

	{ cmd = Clipboard,   keybind = MenuMod .. 'V' },
	{ cmd = Launcher,    keybind = MenuMod .. 'Space' },

	{ cmd = RegCapture,  keybind = 'Print' },
	{ cmd = WinCapture,  keybind = 'SHIFT + Print' },
	{ cmd = ColorPicker, keybind = 'SUPER + C' },
	{ cmd = SysMon,      keybind = 'CTRL + SHIFT + Escape', floating = true },

}
for _, program in ipairs(programs) do
	local rule = {}
	if program.floating then
		rule = {
			floating = true,
			size = {'monitor_w * 0.6', 'monitor_h * 0.5'},
		}
	end
	hl.bind(program.keybind, hl.dsp.exec_cmd(program.cmd, rule))
end
