local LayoutMod = 'ALT + SHIFT + '
local FocusMod =  'SUPER + '
local MoveMod =   'SUPER + CTRL + '
local ResizeMod = 'SUPER + SHIFT + '

local VimL = 'H'
local VimD = 'J'
local VimU = 'K'
local VimR = 'L'

local Mousing = 'mouse:272'   -- left click

local PrevWorkspace = 'comma'
local NextWorkspace = 'period'

local PixelOffset = 8

-- -- >> WINDOW BINDS
local faces = {
	{ symbol = 'l', key = VimL, x = -PixelOffset, y =  0 },
	{ symbol = 'd', key = VimD, x =  0,           y =  PixelOffset },
	{ symbol = 'u', key = VimU, x =  0,           y = -PixelOffset },
	{ symbol = 'r', key = VimR, x =  PixelOffset, y =  0 },
}

for _, face in ipairs(faces) do
	local direction = { direction = face.symbol }
	local offset =    { x = face.x, y = face.y, relative = true }

	hl.bind(ResizeMod .. face.key, hl.dsp.window.resize(offset), { repeating = true })
	hl.bind(FocusMod ..  face.key, hl.dsp.focus(direction),      { repeating = true })
	hl.bind(MoveMod ..   face.key, function()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.move(direction))
		else
			hl.dispatch(hl.dsp.window.move(offset))
		end
	end, { repeating = true })
end

hl.bind(ResizeMod .. Mousing, hl.dsp.window.resize(), { mouse = true })
hl.bind(MoveMod ..   Mousing, hl.dsp.window.drag(),   { mouse = true })

-- -- >> WORKSPACE BINDS
local workspaces = {
	{ rel_lvl = '+1', key = NextWorkspace },
	{ rel_lvl = '-1', key = PrevWorkspace },
}
for _, ws in ipairs(workspaces) do
	local adj_ws = { workspace = ws.rel_lvl }
	hl.bind(FocusMod .. ws.key, hl.dsp.focus(adj_ws))
	hl.bind(MoveMod ..  ws.key, hl.dsp.window.move(adj_ws))
end

-- -- >> GESTURES
hl.gesture({ fingers = 3, direction = 'horizontal', action = 'scroll_move' })
hl.gesture({ fingers = 3, direction = 'vertical',   action = 'workspace' })
hl.gesture({ fingers = 2, direction = 'pinchin',    action = 'fullscreen' })
hl.gesture({ fingers = 2, direction = 'pinchout',   action = 'float' })

-- -- >> LAYOUT TOGGLES
local layouts = {
	S = 'scrolling',
	D = 'dwindle',
	M = 'master',
}
for key, layout in pairs(layouts) do
	hl.bind(LayoutMod .. key, function()
		if hl.get_config('general.layout') == layout then
			hl.exec_cmd('hyprctl reload')
		end
		hl.config({ ['general.layout'] = layout })
	end)
end

-- -- >> WINDOW ACTIONS
hl.bind('SUPER + Q',   hl.dsp.window.close())
hl.bind('F11',         hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind('SHIFT + F11', hl.dsp.window.float({ action = 'toggle' }))

-- -- >> SPECIAL WORKSPACES
hl.bind('CTRL + ALT + SHIFT + G', hl.dsp.workspace.toggle_special('gaming'))

-- -- >> DWINDLE BINDS
hl.bind('SUPER + S', hl.dsp.layout('togglesplit'))
