local key_dec_bl = 'XF86MonBrightnessDown'
local key_inc_bl = 'XF86MonBrightnessUp'

local key_dec_vol = 'XF86AudioLowerVolume'
local key_inc_vol = 'XF86AudioRaiseVolume'
local key_mute_aud = 'XF86AudioMute'
local key_mute_mic = 'F15'

local function SET_BACKLIGHT(sign, num)
	hl.exec_cmd('\
		brightnessctl set ' ..num.. '%' ..sign.. ' &&\
		ddcutil setvcp 10 ' ..sign.. ' ' ..num.. ' --noverify --sleep-multiplier=0.2\
	')
end

-- BACKLIGHT
hl.bind(key_inc_bl, function() SET_BACKLIGHT('+', 25) end)
hl.bind(key_dec_bl, function() SET_BACKLIGHT('-', 25) end)
hl.bind('SHIFT + ' .. key_inc_bl, function() SET_BACKLIGHT('', 100) end)
hl.bind('SHIFT + ' .. key_dec_bl, function() SET_BACKLIGHT('', 0) end)

-- AUDIO
hl.bind(key_inc_vol, hl.dsp.exec_cmd('wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+'), { repeating = true })
hl.bind(key_dec_vol, hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'), { repeating = true })
hl.bind(key_mute_aud, hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'))
hl.bind(key_mute_mic, hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'))
