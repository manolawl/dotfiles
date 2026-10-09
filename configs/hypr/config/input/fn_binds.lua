local decBrightness = 'XF86MonBrightnessDown'
local incBrightness = 'XF86MonBrightnessUp'

local decVolume = 'XF86AudioLowerVolume'
local incVolume = 'XF86AudioRaiseVolume'
local muteAudio = 'XF86AudioMute'
local muteMic =   'XF86Launch6'

local function set_backlight(sign, num)
	hl.exec_cmd('\
		brightnessctl set ' ..num.. '%' ..sign.. ' &&\
		ddcutil setvcp 10 ' ..sign.. ' ' ..num.. ' --noverify --sleep-multiplier=0.2\
	')
end

hl.bind(incBrightness,               function() set_backlight('+', 5)  end)
hl.bind(decBrightness,               function() set_backlight('-', 5)  end)
hl.bind('SHIFT + ' .. incBrightness, function() set_backlight('', 100) end)
hl.bind('SHIFT + ' .. decBrightness, function() set_backlight('', 0)   end)

hl.bind(incVolume, hl.dsp.exec_cmd('wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+'), { repeating = true })
hl.bind(decVolume, hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'),        { repeating = true })
hl.bind(muteAudio, hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'))
hl.bind(muteMic,   hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'))
