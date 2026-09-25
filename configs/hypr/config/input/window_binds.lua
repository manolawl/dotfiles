local LAYOUT_MOD = 'ALT + SHIFT + '
local FOCUS_MOD =  'SUPER + '
local MOVE_MOD =   'SUPER + CTRL + '
local RESIZE_MOD = 'SUPER + SHIFT + '

local GO_LEFT =  'H'
local GO_DOWN =  'J'
local GO_UP =    'K'
local GO_RIGHT = 'L'
local MOUSE_MOVEMENT =      'mouse:272'   -- left click

local PREVIOUS_WORKSPACE = 'semicolon'
local NEXT_WORKSPACE =     'apostrophe'

local MOVE_OFFSET =   16
local RESIZE_OFFSET = 16

-- -- >> WINDOW BINDS
local cardinals = {
	left = {
		key =       GO_LEFT,
		id =        { direction = 'l' },
		move_by =   { x = -MOVE_OFFSET,   y = 0, relative = true },
		resize_by = { x = -RESIZE_OFFSET, y = 0, relative = true }
	},
	down = {
		key =       GO_DOWN,
		id =        { direction = 'd' },
		move_by =   { x = 0, y = MOVE_OFFSET,    relative = true },
		resize_by = { x = 0, y = -RESIZE_OFFSET, relative = true }
	},
	up = {
		key =       GO_UP,
		id =        { direction = 'u' },
		move_by =   { x = 0, y = -MOVE_OFFSET,  relative = true },
		resize_by = { x = 0, y = RESIZE_OFFSET, relative = true }
	},
	right = {
		key =       GO_RIGHT,
		id =        { direction = 'r' },
		move_by =   { x = MOVE_OFFSET,   y = 0, relative = true },
		resize_by = { x = RESIZE_OFFSET, y = 0, relative = true }
	}
} for _, direction in pairs(cardinals) do
	hl.bind(RESIZE_MOD .. direction.key, hl.dsp.window.resize(direction.resize_by), { repeating = true })
	hl.bind(FOCUS_MOD ..  direction.key, hl.dsp.focus(direction.id),                { repeating = true })
	hl.bind(MOVE_MOD ..   direction.key, function()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.move(direction.id))
		else
			hl.dispatch(hl.dsp.window.move(direction.move_by))
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
