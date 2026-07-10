hl.config({
	['render.direct_scanout'] = 0, -- 0=off 1=on 2=auto
	['render.cm_auto_hdr']    = 1, -- 0=off 1=hdr 2=hdredid
	['quirks.prefer_hdr']     = 1, -- 0=off 1=always 2=gamescope
})

hl.monitor({ scale = 1, output = 'eDP-1',    mode = '1920x1080@165', position = '0x0' })
hl.monitor({ scale = 1, output = 'HDMI-A-2', mode = 'preferred',     position = '0x-1080' })
