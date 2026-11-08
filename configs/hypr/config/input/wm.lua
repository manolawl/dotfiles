local ActionMod = 'SUPER + '
local LayoutMod = 'SUPER + ALT + '
local ResizeMod = 'SUPER + SHIFT + '
local LeftClick = 'mouse:272'
local FocusMod =  'SUPER + '
local StepSize =  20 --how many pixels to move or resize via keybinds
local MoveMod =   'SUPER + CTRL + '

--binding window movement, resize, and focus to vim motions
local directions = {
	{ orientation = 'left',  key = 'H', x = -StepSize, y =  0 },
	{ orientation = 'down',  key = 'J', x =  0,        y =  StepSize },
	{ orientation = 'up',    key = 'K', x =  0,        y = -StepSize },
	{ orientation = 'right', key = 'L', x =  StepSize, y =  0 },
}
for _, direction in ipairs(directions) do
	local orientation = { direction = direction.orientation }
	local step = { x = direction.x, y = direction.y, relative = true }

	hl.bind(ResizeMod .. direction.key, hl.dsp.window.resize(step), { repeating = true })
	hl.bind(FocusMod ..  direction.key, hl.dsp.focus(orientation),  { repeating = true })
	hl.bind(MoveMod ..   direction.key, function()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.move(orientation))
		else
			hl.dispatch(hl.dsp.window.move(step))
		end
	end, { repeating = true })
end

--layout switching
hl.bind(LayoutMod .. 'S', function() hl.config({ ['general.layout'] = 'scrolling' }) end)
hl.bind(LayoutMod .. 'D', function() hl.config({ ['general.layout'] = 'dwindle' })   end)

--workspace binds from 1 to WorkspaceTotal
for i = 1, WorkspaceTotal do
	local wsNum = i % WorkspaceTotal + 1

	hl.bind(FocusMod .. wsNum, hl.dsp.focus(       { workspace = wsNum } ))
	hl.bind(MoveMod ..  wsNum, hl.dsp.window.move( { workspace = wsNum } ))
end

hl.bind('CTRL + ALT + SHIFT + G', hl.dsp.workspace.toggle_special('gaming'))

hl.gesture({ fingers = 3, direction = 'horizontal', action = 'scroll_move' })
hl.gesture({ fingers = 3, direction = 'vertical',   action = 'workspace' })
--hl.gesture({ fingers = 2, direction = 'swipe',   action = 'resize' })

hl.bind(ResizeMod .. LeftClick, hl.dsp.window.resize(), { mouse = true })
hl.bind(MoveMod ..   LeftClick, hl.dsp.window.drag(),   { mouse = true })

hl.bind(ActionMod .. 'R',     hl.dsp.reload_config())
hl.bind(ActionMod .. 'Q',     hl.dsp.window.close())
hl.bind(ActionMod .. 'F',     hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind(ActionMod .. 'Space', hl.dsp.window.float({ action = 'toggle' }))

--toggling eye candy
hl.bind(ActionMod .. 'D', function()
	if hl.get_config('animations.enabled') then
		notify('Decoration Disabled!', 24, '#71ffd7')
		hl.exec_cmd('pkill swaybg')
		hl.config({
			['animations.enabled'] =        false,
			['decoration.blur.enabled'] =   false,
			['decoration.rounding'] =       0,
			['decoration.rounding_power'] = 1,
			['general.gaps_in'] =           0,
			['general.gaps_out'] =          0,
		})
	else
		notify('Decoration Enabled!', 24, '#71ffd7')
		hl.exec_cmd('swaybg -m fill -i ~/pictures/backgrounds/background.png')
		hl.config({
			['animations.enabled'] =        true,
			['decoration.blur.enabled'] =   true,
			['decoration.rounding'] =       RoundValue,
			['decoration.rounding_power'] = RoundPower,
			['general.gaps_in'] =           InnerGap,
			['general.gaps_out'] =          OuterGap,
		})
	end
end)
