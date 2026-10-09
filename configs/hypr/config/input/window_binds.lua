local LAYOUT__ = 'ALT + SHIFT + '
local FOCUS__ =  'SUPER + '
local MOVE__ =   'SUPER + CTRL + '
local RESIZE__ = 'SUPER + SHIFT + '

local VIM_L = 'H'
local VIM_D = 'J'
local VIM_U = 'K'
local VIM_R = 'L'

local MOUSING = 'mouse:272'   -- left click

local PREV_WS = 'semicolon'
local NEXT_WS = 'apostrophe'

local OFFSET = 8

-- -- >> WINDOW BINDS
local faces = {
	{ dir = 'l', key = VIM_L, x = -OFFSET, y = 0 },
	{ dir = 'd', key = VIM_D, x = 0,       y = OFFSET },
	{ dir = 'u', key = VIM_U, x = 0,       y = -OFFSET },
	{ dir = 'r', key = VIM_R, x = OFFSET,  y = 0 },
}

for _, face in ipairs(faces) do
	local direction = { direction = face.dir }
	local offset =    { x = face.x, y = face.y, relative = true}

	hl.bind(RESIZE__ .. face.key, hl.dsp.window.resize(offset), { repeating = true })
	hl.bind(FOCUS__ ..  face.key, hl.dsp.focus(direction),      { repeating = true })
	hl.bind(MOVE__ ..   face.key, function()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.move(direction))
		else
			hl.dispatch(hl.dsp.window.move(offset))
		end
	end, { repeating = true })
end

hl.bind(RESIZE__ .. MOUSING, hl.dsp.window.resize(), { mouse = true })
hl.bind(MOVE__ ..   MOUSING, hl.dsp.window.drag(),   { mouse = true })

-- -- >> WORKSPACE BINDS
local workspaces = {
	{ rel_lvl = '+1', key = NEXT_WS },
	{ rel_lvl = '-1', key = PREV_WS },
}
for _, ws in ipairs(workspaces) do
	local adj_ws = { workspace = ws.rel_lvl }
	hl.bind(FOCUS__ .. ws.key, hl.dsp.focus(adj_ws))
	hl.bind(MOVE__ ..  ws.key, hl.dsp.window.move(adj_ws))
end

-- -- >> GESTURES
hl.gesture({ fingers = 3, direction = 'horizontal', action = 'scroll_move' })
hl.gesture({ fingers = 3, direction = 'vertical',   action = 'workspace' })
hl.gesture({ fingers = 4, direction = 'swipe',      action = 'move' })

-- -- >> LAYOUT TOGGLES
local layouts = {
	S = 'scrolling',
	D = 'dwindle',
	M = 'master',
}
for key, layout in pairs(layouts) do
	hl.bind(LAYOUT__ .. key, function()
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
