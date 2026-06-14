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


local function move(dir, offset)
	if not hl.get_active_window().floating then
		hl.dispatch(hl.dsp.window.move({ direction = dir }))

	elseif dir == 'l' then
		hl.dispatch(hl.dsp.window.move({ x = -offset, y = 0, relative = true }))

	elseif dir == 'd' then
		hl.dispatch(hl.dsp.window.move({ x = 0, y = offset,  relative = true }))

	elseif dir == 'u' then
		hl.dispatch(hl.dsp.window.move({ x = 0, y = -offset, relative = true }))

	elseif dir == 'r' then
		hl.dispatch(hl.dsp.window.move({ x = offset, y = 0,  relative = true }))
	end
end

local function resize(action, offset)
	if action == 'shrink_w' then
		hl.dispatch(hl.dsp.window.resize({ x = -offset, y = 0, relative = true }))

	elseif action =='shrink_h' then
		hl.dispatch(hl.dsp.window.resize({ x = 0, y = -offset, relative = true }))

	elseif action == 'extend_h' then
		 hl.dispatch(hl.dsp.window.resize({ x = 0, y = offset, relative = true }))

	elseif action == 'extend_w' then
		hl.dispatch(hl.dsp.window.resize({ x = offset, y = 0, relative = true }))
	end
end

local function toggle_layout(layout)
	if hl.get_config('general.layout') == layout then
		hl.exec_cmd('hyprctl reload')
	end

	hl.config({ ['general.layout'] = layout })
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


-- FOCUS ON ADJACENT WINDOW
hl.bind(FOCUS_MOD .. PRESS_L, hl.dsp.focus({ direction = 'l' }), { repeating = true })
hl.bind(FOCUS_MOD .. PRESS_D, hl.dsp.focus({ direction = 'd' }), { repeating = true })
hl.bind(FOCUS_MOD .. PRESS_U, hl.dsp.focus({ direction = 'u' }), { repeating = true })
hl.bind(FOCUS_MOD .. PRESS_R, hl.dsp.focus({ direction = 'r' }), { repeating = true })
-- MOUSE
hl.bind(FOCUS_MOD .. CLICK_L, hl.dsp.focus({ direction = 'l' }), { release = true })
hl.bind(FOCUS_MOD .. CLICK_D, hl.dsp.focus({ direction = 'd' }), { release = true })
hl.bind(FOCUS_MOD .. CLICK_U, hl.dsp.focus({ direction = 'u' }), { release = true })
hl.bind(FOCUS_MOD .. CLICK_R, hl.dsp.focus({ direction = 'r' }), { release = true })


-- MOVE WINDOW
hl.bind(MOVE_MOD .. PRESS_L, function() move('l', MOVE_OFFSET) end, { repeating = true })
hl.bind(MOVE_MOD .. PRESS_D, function() move('d', MOVE_OFFSET) end, { repeating = true })
hl.bind(MOVE_MOD .. PRESS_U, function() move('u', MOVE_OFFSET) end, { repeating = true })
hl.bind(MOVE_MOD .. PRESS_R, function() move('r', MOVE_OFFSET) end, { repeating = true })
-- MOUSE
hl.bind(MOVE_MOD .. CLICK_L, function() move('l', MOVE_OFFSET) end, { repeating = true })
hl.bind(MOVE_MOD .. CLICK_D, function() move('d', MOVE_OFFSET) end, { repeating = true })
hl.bind(MOVE_MOD .. CLICK_U, function() move('u', MOVE_OFFSET) end, { repeating = true })
hl.bind(MOVE_MOD .. CLICK_R, function() move('r', MOVE_OFFSET) end, { repeating = true })


-- RESIZE WINDOWS
hl.bind(RESIZE_MOD .. PRESS_L, function() resize('shrink_w', RESIZE_OFFSET) end, { repeating = true })
hl.bind(RESIZE_MOD .. PRESS_D, function() resize('shrink_h', RESIZE_OFFSET) end, { repeating = true })
hl.bind(RESIZE_MOD .. PRESS_U, function() resize('extend_h', RESIZE_OFFSET) end, { repeating = true })
hl.bind(RESIZE_MOD .. PRESS_R, function() resize('extend_w', RESIZE_OFFSET) end, { repeating = true })
--MOUSE
hl.bind(RESIZE_MOD .. CLICK_L, function() resize('shrink_w', RESIZE_OFFSET) end, { repeating = true })
hl.bind(RESIZE_MOD .. CLICK_D, function() resize('shrink_h', RESIZE_OFFSET) end, { repeating = true })
hl.bind(RESIZE_MOD .. CLICK_U, function() resize('extend_h', RESIZE_OFFSET) end, { repeating = true })
hl.bind(RESIZE_MOD .. CLICK_R, function() resize('extend_w', RESIZE_OFFSET) end, { repeating = true })


-- FOCUS ON ADJACENT WORKSPACE
hl.bind(FOCUS_MOD .. PRESS_PREV_WORKSPACE, hl.dsp.focus({ workspace = '-1' }), { repeating = true })
hl.bind(FOCUS_MOD .. PRESS_NEXT_WORKSPACE, hl.dsp.focus({ workspace = '+1' }), { repeating = true })
-- MOUSE
hl.bind(FOCUS_MOD .. CLICK_PREV_WORKSPACE, hl.dsp.focus({ workspace = '+1' }))
hl.bind(FOCUS_MOD .. CLICK_NEXT_WORKSPACE, hl.dsp.focus({ workspace = '-1' }))


-- MOVE WINDOW TO ADJACENT WORKSPACE
hl.bind(MOVE_MOD .. PRESS_PREV_WORKSPACE, hl.dsp.window.move({ workspace = '-1' }))
hl.bind(MOVE_MOD .. PRESS_NEXT_WORKSPACE, hl.dsp.window.move({ workspace = '+1' }))
-- MOUSE
hl.bind(MOVE_MOD .. CLICK_PREV_WORKSPACE, hl.dsp.window.move({ workspace = '+1' }))
hl.bind(MOVE_MOD .. CLICK_NEXT_WORKSPACE, hl.dsp.window.move({ workspace = '-1' }))


-- SPECIAL WORKSPACES
hl.bind('CTRL + ALT + SHIFT + G', hl.dsp.workspace.toggle_special('gaming'))


-- DWINDLE SPECIFIC
hl.bind('SUPER + S', hl.dsp.layout('togglesplit'))
