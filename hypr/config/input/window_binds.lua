local FOCUS_MOD =  'SUPER + '
local MOVE_MOD =   'SUPER + CTRL + '
local RESIZE_MOD = 'SUPER + SHIFT + '

local PRESS_L = 'H'
local PRESS_D = 'J'
local PRESS_U = 'K'
local PRESS_R = 'L'

local CLICK_L = 'mouse:272' -- left click
local CLICK_R = 'mouse:273' -- right click
local CLICK_U = 'mouse:276' -- front side click
local CLICK_D = 'mouse:275' -- rear side click

local PRESS_PREV_WORKSPACE = 'semicolon'
local PRESS_NEXT_WORKSPACE = 'apostrophe'

local CLICK_NEXT_WORKSPACE = 'mouse_down' -- scroll down
local CLICK_PREV_WORKSPACE = 'mouse_up' -- scroll up

local MOVE_OFFSET =   16
local RESIZE_OFFSET = 16


local function toggle_layout(layout)
	if hl.get_config('general.layout') == layout then
		hl.exec_cmd('hyprctl reload')
	end
	hl.config({ ['general.layout'] = layout })
end


local directions = {
	left = {
		id =    { direction = 'l' },
		key =   PRESS_L,
		click = CLICK_L,
		move_offset =   { x = -MOVE_OFFSET,   y = 0, relative = true },
		resize_offset = { x = -RESIZE_OFFSET, y = 0, relative = true }
	},
	down = {
		id =   { direction =  'd' },
		key =   PRESS_D,
		click = CLICK_D,
		move_offset =   { x = 0, y = MOVE_OFFSET,    relative = true },
		resize_offset = { x = 0, y = -RESIZE_OFFSET, relative = true }
	},
	up = {
		id =   { direction =  'u' },
		key =   PRESS_U,
		click = CLICK_U,
		move_offset =   { x = 0, y = -MOVE_OFFSET,  relative = true },
		resize_offset = { x = 0, y = RESIZE_OFFSET, relative = true }
	},
	right = {
		id =   { direction =  'r' },
		key =   PRESS_R,
		click = CLICK_R,
		move_offset =   { x = MOVE_OFFSET,   y = 0, relative = true },
		resize_offset = { x = RESIZE_OFFSET, y = 0, relative = true }
	}
}
-- loops and defines resize, focus, and move binds per direction
for _, direction in pairs(directions) do
	-- keyboard
	hl.bind(RESIZE_MOD .. direction.key, hl.dsp.window.resize(direction.resize_offset), { repeating = true })
	hl.bind(FOCUS_MOD ..  direction.key, hl.dsp.focus(direction.id),                    { repeating = true })
	hl.bind(MOVE_MOD ..   direction.key, function()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.move(direction.id))
		else
			hl.dispatch(hl.dsp.window.move(direction.move_offset))
		end
	end, { repeating = true })
	--mouse
	hl.bind(RESIZE_MOD .. direction.click, hl.dsp.window.resize(direction.resize_offset), { repeating = true })
	hl.bind(FOCUS_MOD ..  direction.click, hl.dsp.focus(direction.id),                    { repeating = true })
	hl.bind(MOVE_MOD ..   direction.click, function()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.move(direction.id))
		else
			hl.dispatch(hl.dsp.window.move(direction.move_offset))
		end
	end, { repeating = true })
end


local workspaces = {
	next_workspace = {
		id = { workspace = '+1' },
		mid = { workspace = '-1' },
		key = PRESS_NEXT_WORKSPACE,
		click = CLICK_NEXT_WORKSPACE
	},
	prev_workspace = {
		id = { workspace = '-1' },
		mid = { workspace = '+1' },
		key = PRESS_PREV_WORKSPACE,
		click = CLICK_PREV_WORKSPACE
	}
}
for _, workspace in pairs(workspaces) do
	hl.bind(FOCUS_MOD .. workspace.key, hl.dsp.focus(workspace.id))
	hl.bind(MOVE_MOD .. workspace.key, hl.dsp.window.move(workspace.id))
	hl.bind(FOCUS_MOD .. workspace.click, hl.dsp.focus(workspace.mid))
	hl.bind(MOVE_MOD .. workspace.click, hl.dsp.focus(workspace.mid))
end


-- TOUCHPAD GESTURES
hl.gesture({ fingers = 3, direction = 'horizontal', action = 'scroll_move' })
hl.gesture({ fingers = 3, direction = 'vertical',   action = 'workspace' })


-- LAYOUT TOGGLES
hl.bind('ALT + SHIFT + S', function() toggle_layout('scrolling') end)
hl.bind('ALT + SHIFT + D', function() toggle_layout('dwindle') end)
hl.bind('ALT + SHIFT + M', function() toggle_layout('master') end)


-- WINDOW ACTIONS (macOS-like window decorations?)
hl.bind('SUPER + Q',   hl.dsp.window.close())
hl.bind('F11',         hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind('SHIFT + F11', hl.dsp.window.float({ action = 'toggle' }))


-- SPECIAL WORKSPACES
hl.bind('CTRL + ALT + SHIFT + G', hl.dsp.workspace.toggle_special('gaming'))


-- DWINDLE SPECIFIC
hl.bind('SUPER + S', hl.dsp.layout('togglesplit'))
