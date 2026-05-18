local directory = os.getenv("BACKGROUNDS_DIR") .. "/4k_wallpapers_from_reddit"
local mode = "fill"

math.randomseed(os.time())

local function random_wallpaper()
	local files = {}

	local cmd =
		'find "' .. directory .. '" -type f \\( ' ..
		'-iname "*.jpg" -o ' ..
		'-iname "*.jpeg" -o ' ..
		'-iname "*.png" -o ' ..
		'-iname "*.webp" ' ..
		'\\)'

	for file in io.popen(cmd):lines() do
		table.insert(files, file)
	end

	if #files == 0 then
		return nil
	end

	return files[math.random(#files)]
end

local function set_wallpaper()
	local wall = random_wallpaper()

	if not wall then
		return
	end

	os.execute("pkill -x swaybg")
	os.execute(
		'swaybg -i "' ..
		wall ..
		'" -m "' ..
		mode ..
		'" &'
	)
end

set_wallpaper()

local bg_timer = hl.timer(set_wallpaper, {
	timeout = 300000,
	type = "repeat",
})
bg_timer:set_enabled(true)

