local function set_backlight(sign, num)
	hl.exec_cmd('\
		brightnessctl set ' ..num.. '%' ..sign.. ' &&\
		ddcutil setvcp 10 ' ..sign.. ' ' ..num.. ' --noverify --sleep-multiplier=0.2\
	')
end

-- BACKLIGHT
hl.bind(INCREASE_BACKLIGHT, function() set_backlight('+', 25) end)
hl.bind(DECREASE_BACKLIGHT, function() set_backlight('-', 25) end)
hl.bind('SHIFT + ' .. INCREASE_BACKLIGHT, function() set_backlight('', 100) end)
hl.bind('SHIFT + ' .. DECREASE_BACKLIGHT, function() set_backlight('', 0) end)

-- AUDIO
hl.bind(INCREASE_VOL, hl.dsp.exec_cmd('wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+'), { repeating = true })
hl.bind(DECREASE_VOL, hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'), { repeating = true })
hl.bind(MUTE_AUD, hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'))
hl.bind(MUTE_MIC, hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'))
