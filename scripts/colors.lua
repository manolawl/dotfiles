function sum(table)
	local result = 0
	for k, v in pairs(table) do
		result = result + v
	end
	return result
end

function clamp(x, min, max)
	if x < min then return min end
	if x > max then return max end
	return x
end

function round(x)
	return math.floor(x + 0.5)
end

color = {
	normal = { red = 0.65, green = 0.55, blue = 1 },
	skew = { red = 3, green = 3.5, blue = 2.15 },
	brightness = { low = 0.5, mid = 1, high = 1.5 },
}

color.skewed = {}
for k, v in pairs(color.normal) do
	color.skewed[k] = v * color.skew[k]
end

factor = {}
for k, v in pairs(color.brightness) do
	factor[k] = (255 * v)/sum(color.normal)
end

channel = {
	low = { normal = {}, skewed = {} },
	mid = { normal = {}, skewed = {} },
	high = { normal = {}, skewed = {} },
}
for k1, v1 in pairs(factor) do
	for k2, v2  in pairs(color.normal) do
		channel[k1].normal[k2] = round(clamp (v1 * v2, 0, 255))
	end
	for k3, v3  in pairs(color.skewed) do
		channel[k1].skewed[k3] = round(clamp (v1 * v3, 0, 255))
	end
end
primary = {}

primary.low.blue = { channel.low.normal.red, channel.low.normal.green, channel.low.skewed.blue }
primary.mid.blue = { channel.mid.normal.red, channel.mid.normal.green, channel.mid.skewed.blue }
primary.high.blue = { channel.high.normal.red, channel.high.normal.green, channel.high.skewed.blue }
