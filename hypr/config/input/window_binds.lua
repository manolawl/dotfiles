local focus_mod = 'SUPER + '
local move_mod = 'SUPER + CTRL + '
local resize_mod = 'SUPER + SHIFT + '

-- VIM MOTIONS
local key_l = 'H'
local key_d = 'J'
local key_u = 'K'
local key_r = 'L'

local mouse_l = 'mouse:272' -- left click
local mouse_r = 'mouse:273' -- right click
local mouse_u = 'mouse:276' -- front side click
local mouse_d = 'mouse:275' -- rear side click

local key_prev_ws = 'semicolon'
local key_next_ws = 'apostrophe'

local mouse_next_ws = 'mouse_down' -- scroll down
local mouse_prev_ws = 'mouse_up' -- scroll up



local function move(dir)
	local offset = 16

	if not hl.get_active_window().floating then
		hl.dispatch(hl.dsp.window.move({ direction = dir }))

	elseif dir == 'l' then
		hl.dispatch(hl.dsp.window.move({ x = -offset, y = 0, relative = true }))

	elseif dir == 'd' then
		hl.dispatch(hl.dsp.window.move({ x = 0, y = offset, relative = true }))

	elseif dir == 'u' then
		hl.dispatch(hl.dsp.window.move({ x = 0, y = -offset, relative = true }))

	elseif dir == 'r' then
		hl.dispatch(hl.dsp.window.move({ x = offset, y = 0, relative = true }))
	end
end

local function resize(transform)
	local offset = 16

	if transform == 'shrink_w' then
		hl.dispatch(hl.dsp.window.resize({ x = -offset, y = 0, relative = true }))

	elseif transform =='shrink_h' then
		hl.dispatch(hl.dsp.window.resize({ x = 0, y = -offset, relative = true }))

	elseif transform == 'extend_h' then
		hl.dispatch(hl.dsp.window.resize({ x = 0, y = offset, relative = true }))

	elseif transform == 'extend_w' then
		hl.dispatch(hl.dsp.window.resize({ x = offset, y = 0, relative = true }))
	end
end

local function toggle_layout(layout)
	if hl.get_config('general.layout') == layout then
		hl.exec_cmd('hyprctl reload')
	end

	hl.config({ ['general.layout'] = layout })
end



-- WINDOW ACTIONS (macOS-like window decorations?)
hl.bind('SUPER + Q', hl.dsp.window.close())
hl.bind('F11', hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind('SHIFT + F11', hl.dsp.window.float({ action = 'toggle' }))



-- FOCUS ON ADJACENT WINDOW
hl.bind(focus_mod .. key_l, hl.dsp.focus({ direction = 'l' }), { repeating = true })
hl.bind(focus_mod .. key_d, hl.dsp.focus({ direction = 'd' }), { repeating = true })
hl.bind(focus_mod .. key_u, hl.dsp.focus({ direction = 'u' }), { repeating = true })
hl.bind(focus_mod .. key_r, hl.dsp.focus({ direction = 'r' }), { repeating = true })
-- MOUSE
hl.bind(focus_mod .. mouse_l, hl.dsp.focus({ direction = 'l' }), { release = true })
hl.bind(focus_mod .. mouse_d, hl.dsp.focus({ direction = 'd' }), { release = true })
hl.bind(focus_mod .. mouse_u, hl.dsp.focus({ direction = 'u' }), { release = true })
hl.bind(focus_mod .. mouse_r, hl.dsp.focus({ direction = 'r' }), { release = true })



-- MOVE WINDOW
hl.bind(move_mod .. key_l, function() move('l') end, { repeating = true })
hl.bind(move_mod .. key_d, function() move('d') end, { repeating = true })
hl.bind(move_mod .. key_u, function() move('u') end, { repeating = true })
hl.bind(move_mod .. key_r, function() move('r') end, { repeating = true })
-- MOUSE
hl.bind(move_mod .. mouse_l, function() move('l') end, { repeating = true })
hl.bind(move_mod .. mouse_d, function() move('d') end, { repeating = true })
hl.bind(move_mod .. mouse_u, function() move('u') end, { repeating = true })
hl.bind(move_mod .. mouse_r, function() move('r') end, { repeating = true })



-- RESIZE WINDOWS
hl.bind(resize_mod .. key_l, function() resize('shrink_w') end, { repeating = true })
hl.bind(resize_mod .. key_d, function() resize('shrink_h') end, { repeating = true })
hl.bind(resize_mod .. key_u, function() resize('extend_h') end, { repeating = true })
hl.bind(resize_mod .. key_r, function() resize('extend_w') end, { repeating = true })
--MOUSE
hl.bind(resize_mod .. mouse_l, function() resize('shrink_w') end, { repeating = true })
hl.bind(resize_mod .. mouse_d, function() resize('shrink_h') end, { repeating = true })
hl.bind(resize_mod .. mouse_u, function() resize('extend_h') end, { repeating = true })
hl.bind(resize_mod .. mouse_r, function() resize('extend_w') end, { repeating = true })



-- FOCUS ON ADJACENT WORKSPACE
hl.bind(focus_mod .. key_prev_ws, hl.dsp.focus({ workspace = '-1' }), { repeating = true })
hl.bind(focus_mod .. key_next_ws, hl.dsp.focus({ workspace = '+1' }), { repeating = true })
-- MOUSE
hl.bind(focus_mod .. mouse_prev_ws, hl.dsp.focus({ workspace = '+1' }))
hl.bind(focus_mod .. mouse_next_ws, hl.dsp.focus({ workspace = '-1' }))
-- TOUCHPAD
hl.gesture({ fingers = 3, direction = 'vertical', action = 'workspace' })



-- MOVE WINDOW TO ADJACENT WORKSPACE
hl.bind(move_mod .. key_prev_ws, hl.dsp.window.move({ workspace = '-1' }))
hl.bind(move_mod .. key_next_ws, hl.dsp.window.move({ workspace = '+1' }))
-- MOUSE
hl.bind(move_mod .. mouse_prev_ws, hl.dsp.window.move({ workspace = '+1' }))
hl.bind(move_mod .. mouse_next_ws, hl.dsp.window.move({ workspace = '-1' }))



-- SPECIAL WORKSPACES
hl.bind('CTRL + ALT + SHIFT + G', hl.dsp.workspace.toggle_special('gaming'))



-- LAYOUTS
hl.bind('ALT + SHIFT + S', function() toggle_layout('scrolling') end)
hl.bind('ALT + SHIFT + D', function() toggle_layout('dwindle') end)
hl.bind('ALT + SHIFT + M', function() toggle_layout('master') end)



-- DWINDLE SPECIFIC
hl.bind('SUPER + S', hl.dsp.layout('togglesplit'))



-- SCROLLING SPECIFIC
--hl.bind('SUPER + comma', hl.dsp.layout('consume'))
--hl.bind('SUPER + period', hl.dsp.layout('expel'))
hl.gesture({ fingers = 3, direction = 'horizontal', action = 'scroll_move' })
