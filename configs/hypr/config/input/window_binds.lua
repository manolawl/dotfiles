local layoutMod = 'ALT + SHIFT + '
local focusMod =  'SUPER + '
local moveMod =   'SUPER + CTRL + '
local resizeMod = 'SUPER + SHIFT + '

local vimL = 'H'
local vimD = 'J'
local vimU = 'K'
local vimR = 'L'

local mousing = 'mouse:272'   -- left click

local prevWorkspace = 'comma'
local nextWorkspace = 'period'

local pixelOffset = 8

-- -- >> WINDOW BINDS
local faces = {
	{ symbol = 'l', key = vimL, x = -pixelOffset, y =  0 },
	{ symbol = 'd', key = vimD, x =  0,           y =  pixelOffset },
	{ symbol = 'u', key = vimU, x =  0,           y = -pixelOffset },
	{ symbol = 'r', key = vimR, x =  pixelOffset, y =  0 },
}

for _, face in ipairs(faces) do
	local direction = { direction = face.symbol }
	local offset =    { x = face.x, y = face.y, relative = true }

	hl.bind(resizeMod .. face.key, hl.dsp.window.resize(offset), { repeating = true })
	hl.bind(focusMod ..  face.key, hl.dsp.focus(direction),      { repeating = true })
	hl.bind(moveMod ..   face.key, function()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.move(direction))
		else
			hl.dispatch(hl.dsp.window.move(offset))
		end
	end, { repeating = true })
end

hl.bind(resizeMod .. mousing, hl.dsp.window.resize(), { mouse = true })
hl.bind(moveMod ..   mousing, hl.dsp.window.drag(),   { mouse = true })

-- -- >> WORKSPACE BINDS
local workspaces = {
	{ rel_lvl = '+1', key = nextWorkspace },
	{ rel_lvl = '-1', key = prevWorkspace },
}
for _, ws in ipairs(workspaces) do
	local adj_ws = { workspace = ws.rel_lvl }
	hl.bind(focusMod .. ws.key, hl.dsp.focus(adj_ws))
	hl.bind(moveMod ..  ws.key, hl.dsp.window.move(adj_ws))
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
	hl.bind(layoutMod .. key, function()
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
