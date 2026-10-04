local LAYOUT_MOD = 'ALT + SHIFT + '
local FOCUS_MOD =  'SUPER + '
local MOVE_MOD =   'SUPER + CTRL + '
local RESIZE_MOD = 'SUPER + SHIFT + '

local GO_LEFT =  'H'
local GO_DOWN =  'J'
local GO_UP =    'K'
local GO_RIGHT = 'L'

local MOUSE_MOVEMENT = 'mouse:272'   -- left click

local PREVIOUS_WORKSPACE = 'semicolon'
local NEXT_WORKSPACE =     'apostrophe'

local OFFSET = 8

-- -- >> WINDOW BINDS
local faces = {
	left = {
		key =    GO_LEFT,
		id =     { direction = 'l' },
		offset = { x = -OFFSET, y = 0, relative = true },
	},
	down = {
		key =    GO_DOWN,
		id =     { direction = 'd' },
		offset = { x = 0, y = OFFSET, relative = true },
	},
	up = {
		key =    GO_UP,
		id =     { direction = 'u' },
		offset = { x = 0, y = -OFFSET, relative = true },
	},
	right = {
		key =    GO_RIGHT,
		id =     { direction = 'r' },
		offset = { x = OFFSET, y = 0, relative = true },
	}
} for _, face in pairs(faces) do
	hl.bind(RESIZE_MOD .. face.key, hl.dsp.window.resize(face.offset), { repeating = true })
	hl.bind(FOCUS_MOD ..  face.key, hl.dsp.focus(face.id),         { repeating = true })
	hl.bind(MOVE_MOD ..   face.key, function()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.move(face.id))
		else
			hl.dispatch(hl.dsp.window.move(face.offset))
		end
	end, { repeating = true })
end

hl.bind(RESIZE_MOD .. MOUSE_MOVEMENT, hl.dsp.window.resize(), { mouse = true })
hl.bind(MOVE_MOD ..   MOUSE_MOVEMENT, hl.dsp.window.drag(),   { mouse = true })

-- -- >> WORKSPACE BINDS
local workspaces = {
	next_workspace =     { id = { workspace = '+1' }, key = NEXT_WORKSPACE },
	previous_workspace = { id = { workspace = '-1' }, key = PREVIOUS_WORKSPACE }
} for _, workspace in pairs(workspaces) do
	hl.bind(FOCUS_MOD .. workspace.key, hl.dsp.focus(workspace.id))
	hl.bind(MOVE_MOD ..  workspace.key, hl.dsp.window.move(workspace.id))
end

-- -- >> GESTURES
hl.gesture({ fingers = 3, direction = 'horizontal', action = 'scroll_move' })
hl.gesture({ fingers = 3, direction = 'vertical',   action = 'workspace' })
hl.gesture({ fingers = 4, direction = 'swipe',      action = 'move' })

-- -- >> LAYOUT TOGGLES
local layouts = {
	scrolling = { id = 'scrolling', key = 'S' },
	dwindle =   { id = 'dwindle',   key = 'D' },
	master =    { id = 'master',    key = 'M' },
} for _, layout in pairs(layouts) do
	hl.bind(LAYOUT_MOD .. layout.key, function()
		if hl.get_config('general.layout') == layout.id then
			hl.exec_cmd('hyprctl reload')
		end
		hl.config({ ['general.layout'] = layout.id })
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
