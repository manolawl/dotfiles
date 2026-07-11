-- -- >> window binds
local directions = {
	left = {
		id =  { direction = 'l' },
		key = PRESS_L,
		move_offset =   { x = -MOVE_OFFSET,   y = 0, relative = true },
		resize_offset = { x = -RESIZE_OFFSET, y = 0, relative = true }
	},
	down = {
		id = { direction = 'd' },
		key = PRESS_D,
		move_offset =   { x = 0, y = MOVE_OFFSET,    relative = true },
		resize_offset = { x = 0, y = -RESIZE_OFFSET, relative = true }
	},
	up = {
		id =  { direction = 'u' },
		key = PRESS_U,
		move_offset =   { x = 0, y = -MOVE_OFFSET,  relative = true },
		resize_offset = { x = 0, y = RESIZE_OFFSET, relative = true }
	},
	right = {
		id =  { direction = 'r' },
		key = PRESS_R,
		move_offset =   { x = MOVE_OFFSET,   y = 0, relative = true },
		resize_offset = { x = RESIZE_OFFSET, y = 0, relative = true }
	}
} for _, dir in pairs(directions) do
	hl.bind(RESIZE_MOD .. dir.key, hl.dsp.window.resize(dir.resize_offset), { repeating = true })
	hl.bind(FOCUS_MOD ..  dir.key, hl.dsp.focus(dir.id),                    { repeating = true })
	hl.bind(MOVE_MOD ..   dir.key, function()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.move(dir.id))
		else
			hl.dispatch(hl.dsp.window.move(dir.move_offset))
		end
	end, { repeating = true })
end

-- -- >> workspace binds
local workspaces = {
	next_workspace = { id = { workspace = '+1' }, key = PRESS_NEXT_WORKSPACE },
	prev_workspace = { id = { workspace = '-1' }, key = PRESS_PREV_WORKSPACE }
} for _, ws in pairs(workspaces) do
	hl.bind(FOCUS_MOD .. ws.key, hl.dsp.focus(ws.id))
	hl.bind(MOVE_MOD  .. ws.key, hl.dsp.window.move(ws.id))
end

-- -- >> gestures
hl.gesture({ fingers = 3, direction = 'horizontal', action = 'scroll_move' })
hl.gesture({ fingers = 3, direction = 'vertical',   action = 'workspace' })


-- -- >> layout toggles
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

-- -- >> window actions
hl.bind('SUPER + Q',   hl.dsp.window.close())
hl.bind('F11',         hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind('SHIFT + F11', hl.dsp.window.float({ action = 'toggle' }))

-- -- >> special workspaces
hl.bind('CTRL + ALT + SHIFT + G', hl.dsp.workspace.toggle_special('gaming'))

-- -- >> dwindle binds
hl.bind('SUPER + S', hl.dsp.layout('togglesplit'))
