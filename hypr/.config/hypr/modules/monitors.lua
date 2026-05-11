function monitor(s, w, h, f)
	local m = {}

	m.scale = s
	m.width = w
	m.height = h
	m.frequency = f

	m.scaled_width = w / s
	m.scaled_height = h / s

	m.mode = w .. "x" .. h .. "@" .. f

	return m
end

mon1 = monitor(4/3, 1920, 1080, 165)
mon2 = monitor(1, 1920, 1080, 75)

position = {
	top = function(main, side)
		side.x = (main.scaled_width - side.scaled_width) / 2
		side.y =  -side.scaled_height
		return side.x .. "x" .. side.y
	end,

	bottom = function(main, side)
		side.x = (main.scaled_width - side.scaled_width) / 2
		side.y =  side.scaled_height
		return side.x .. "x" .. side.y
	end,

	left = function(main, side)
		side.x = -side.scaled_width
		side.y = (main.scaled_height - side.scaled_height) / 2
		return side.x .. "x" .. side.y
	end,

	right = function(main, side)
		side.x = side.scaled_width
		side.y = (main.scaled_height - side.scaled_height) / 2
		return side.x .. "x" .. side.y
	end,
}


-- MONITORS
hl.monitor({
	output = "eDP-1",
	scale = mon1.scale,
	mode = mon1.mode,
	position = "0x0"
})

hl.monitor({
	output = "HDMI-A-2",
	scale = mon2.scale,
	mode = mon2.mode,
	position = position.top(mon1, mon2)
})
