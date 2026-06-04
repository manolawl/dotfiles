local focus_mod = 'SUPER + '
local move_mod = 'SUPER + CTRL + '
local resize_mod = 'SUPER + SHIFT + '

-- VIM MOTIONS
local kb_l = 'H'
local kb_d = 'J'
local kb_u = 'K'
local kb_r = 'L'

local ms_l = 'mouse:272' -- left click
local ms_r = 'mouse:273' -- right click
local ms_u = 'mouse:276' -- front side click
local ms_d = 'mouse:275' -- rear side click

local kb_prev_ws = 'semicolon'
local kb_next_ws = 'apostrophe'

local ms_next_ws = 'mouse_down' -- scroll down
local ms_prev_ws = 'mouse_up' -- scroll up

local move_offset = 16
local resize_offset = 16


local function MOVE(direction)
	local offset = move_offset

	if not hl.get_active_window().floating then
		hl.dispatch(hl.dsp.window.move({ direction = direction }))

	elseif direction == 'l' then
		hl.dispatch(hl.dsp.window.move({ x = -offset, y = 0, relative = true }))

	elseif direction == 'd' then
		hl.dispatch(hl.dsp.window.move({ x = 0, y = offset, relative = true }))

	elseif direction == 'u' then
		hl.dispatch(hl.dsp.window.move({ x = 0, y = -offset, relative = true }))

	elseif direction == 'r' then
		hl.dispatch(hl.dsp.window.move({ x = offset, y = 0, relative = true }))
	end
end

local function RESIZE(action)
	local offset = resize_offset

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

local function TOGGLE_LAYOUT(layout)
	if hl.get_config('general.layout') == layout then
		hl.exec_cmd('hyprctl reload')
	end

	hl.config({ ['general.layout'] = layout })
end



-- TOUCHPAD GESTURES
hl.gesture({ fingers = 3, direction = 'horizontal', action = 'scroll_move' })
hl.gesture({ fingers = 3, direction = 'vertical', action = 'workspace' })



-- LAYOUT TOGGLES
hl.bind('ALT + SHIFT + S', function() TOGGLE_LAYOUT('scrolling') end)
hl.bind('ALT + SHIFT + D', function() TOGGLE_LAYOUT('dwindle') end)
hl.bind('ALT + SHIFT + M', function() TOGGLE_LAYOUT('master') end)



-- WINDOW ACTIONS (macOS-like window decorations?)
hl.bind('SUPER + Q', hl.dsp.window.close())
hl.bind('F11', hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind('SHIFT + F11', hl.dsp.window.float({ action = 'toggle' }))



-- FOCUS ON ADJACENT WINDOW
hl.bind(focus_mod .. kb_l, hl.dsp.focus({ direction = 'l' }), { repeating = true })
hl.bind(focus_mod .. kb_d, hl.dsp.focus({ direction = 'd' }), { repeating = true })
hl.bind(focus_mod .. kb_u, hl.dsp.focus({ direction = 'u' }), { repeating = true })
hl.bind(focus_mod .. kb_r, hl.dsp.focus({ direction = 'r' }), { repeating = true })
-- MOUSE
hl.bind(focus_mod .. ms_l, hl.dsp.focus({ direction = 'l' }), { release = true })
hl.bind(focus_mod .. ms_d, hl.dsp.focus({ direction = 'd' }), { release = true })
hl.bind(focus_mod .. ms_u, hl.dsp.focus({ direction = 'u' }), { release = true })
hl.bind(focus_mod .. ms_r, hl.dsp.focus({ direction = 'r' }), { release = true })



-- MOVE WINDOW
hl.bind(move_mod .. kb_l, function() MOVE('l') end, { repeating = true })
hl.bind(move_mod .. kb_d, function() MOVE('d') end, { repeating = true })
hl.bind(move_mod .. kb_u, function() MOVE('u') end, { repeating = true })
hl.bind(move_mod .. kb_r, function() MOVE('r') end, { repeating = true })
-- MOUSE
hl.bind(move_mod .. ms_l, function() MOVE('l') end, { repeating = true })
hl.bind(move_mod .. ms_d, function() MOVE('d') end, { repeating = true })
hl.bind(move_mod .. ms_u, function() MOVE('u') end, { repeating = true })
hl.bind(move_mod .. ms_r, function() MOVE('r') end, { repeating = true })



-- RESIZE WINDOWS
hl.bind(resize_mod .. kb_l, function() RESIZE('shrink_w') end, { repeating = true })
hl.bind(resize_mod .. kb_d, function() RESIZE('shrink_h') end, { repeating = true })
hl.bind(resize_mod .. kb_u, function() RESIZE('extend_h') end, { repeating = true })
hl.bind(resize_mod .. kb_r, function() RESIZE('extend_w') end, { repeating = true })
--MOUSE
hl.bind(resize_mod .. ms_l, function() RESIZE('shrink_w') end, { repeating = true })
hl.bind(resize_mod .. ms_d, function() RESIZE('shrink_h') end, { repeating = true })
hl.bind(resize_mod .. ms_u, function() RESIZE('extend_h') end, { repeating = true })
hl.bind(resize_mod .. ms_r, function() RESIZE('extend_w') end, { repeating = true })



-- FOCUS ON ADJACENT WORKSPACE
hl.bind(focus_mod .. kb_prev_ws, hl.dsp.focus({ workspace = '-1' }), { repeating = true })
hl.bind(focus_mod .. kb_next_ws, hl.dsp.focus({ workspace = '+1' }), { repeating = true })
-- MOUSE
hl.bind(focus_mod .. ms_prev_ws, hl.dsp.focus({ workspace = '+1' }))
hl.bind(focus_mod .. ms_next_ws, hl.dsp.focus({ workspace = '-1' }))



-- MOVE WINDOW TO ADJACENT WORKSPACE
hl.bind(move_mod .. kb_prev_ws, hl.dsp.window.move({ workspace = '-1' }))
hl.bind(move_mod .. kb_next_ws, hl.dsp.window.move({ workspace = '+1' }))
-- MOUSE
hl.bind(move_mod .. ms_prev_ws, hl.dsp.window.move({ workspace = '+1' }))
hl.bind(move_mod .. ms_next_ws, hl.dsp.window.move({ workspace = '-1' }))



-- SPECIAL WORKSPACES
hl.bind('CTRL + ALT + SHIFT + G', hl.dsp.workspace.toggle_special('gaming'))



-- DWINDLE SPECIFIC
hl.bind('SUPER + S', hl.dsp.layout('togglesplit'))
