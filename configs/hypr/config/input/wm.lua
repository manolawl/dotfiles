local vectors = {
	{ dir = 'l', key = DirL, x = -PixelChange, y = 0 },
	{ dir = 'd', key = DirD, x =  0,      y =  PixelChange },
	{ dir = 'u', key = DirU, x =  0,      y = -PixelChange },
	{ dir = 'r', key = DirR, x =  PixelChange, y = 0 },
}

local layouts = {
	S = 'scrolling',
	D = 'dwindle',
	M = 'master',
}

for _, vector in ipairs(vectors) do
	local direction = { direction = vector.dir }
	local offset =    { x = vector.x, y = vector.y, relative = true }

	hl.bind(ResizeMod .. vector.key, hl.dsp.window.resize(offset), { repeating = true })
	hl.bind(FocusMod ..  vector.key, hl.dsp.focus(direction),      { repeating = true })
	hl.bind(MoveMod ..   vector.key, function()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.move(direction))
		else
			hl.dispatch(hl.dsp.window.move(offset))
		end
	end, { repeating = true })
end

for key, layout in pairs(layouts) do
	hl.bind(LayoutMod .. key, function()
		hl.config({ ['general.layout'] = layout })
	end)
end

for i = 1, WorkspaceTotal do
	local workspaceNum = i % WorkspaceTotal + 1

	hl.bind(FocusMod .. workspaceNum, hl.dsp.focus(       { workspace = workspaceNum } ))
	hl.bind(MoveMod ..  workspaceNum, hl.dsp.window.move( { workspace = workspaceNum } ))
end

hl.bind(ResizeMod .. MainMouseBtn, hl.dsp.window.resize(), { mouse = true })
hl.bind(MoveMod ..   MainMouseBtn, hl.dsp.window.drag(),   { mouse = true })

hl.bind('SUPER + Q',         hl.dsp.window.close())
hl.bind('SUPER + R',         hl.dsp.reload_config())
hl.bind('SUPER + F',         hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind('SUPER + SHIFT + F', hl.dsp.window.float({ action = 'toggle' }))

hl.bind('CTRL + ALT + SHIFT + G', hl.dsp.workspace.toggle_special('gaming'))

hl.bind('SUPER + D', function()
	if hl.get_config('animations.enabled') then
		hl.notification.create({ text = 'Decorations Disabled', font_size = 16, timeout = 1500 })
		hl.exec_cmd('pkill swaybg')
		hl.config({
			['animations.enabled'] = false,
			['decoration.blur.enabled'] = false,
			['decoration.rounding'] = 0,
			['general.gaps_in'] = 0,
			['general.gaps_out'] = 0,
		})
	else
		hl.notification.create({ text = 'Decorations Enabled', font_size = 16, timeout = 1500 })
		hl.exec_cmd('swaybg -m fill -i ~/pictures/backgrounds/background.png')
		hl.config({
			['animations.enabled'] = true,
			['decoration.blur.enabled'] = true,
			['decoration.rounding'] = RoundValue,
			['general.gaps_in'] = InnerGap,
			['general.gaps_out'] = OuterGap,
		})
	end
end)
