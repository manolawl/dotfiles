hl.config({
	['render.direct_scanout'] = 0, -- 0=off 1=on 2=auto
	['render.cm_auto_hdr'] =    0, -- 0=off 1=hdr 2=hdredid
	['quirks.prefer_hdr'] =     0, -- 0=off 1=always 2=gamescope
	['misc.vrr'] =              0, -- variable refresh rate, disabled because of jittering
	['general.allow_tearing'] = true, -- screen tearing
})

hl.monitor({ scale = 1, output = 'eDP-1',    mode = '1920x1080@165', position = '0x0' })
hl.monitor({ scale = 1, output = 'HDMI-A-2', mode = '1920x1080@75',  position = '1920x-810' })
