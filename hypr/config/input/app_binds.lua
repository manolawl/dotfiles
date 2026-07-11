local programs = {
	terminal =    { id = TERMINAL,     key = 'T' },
	browser =     { id = BROWSER,      key = 'B' },
	fileManager = { id = FILE_MANAGER, key = 'F' },
	sysMonitor =  { id = SYS_MONITOR,  key = 'M' },
	colPicker =   { id = COL_PICKER,   key = 'C' },
} for _, program in pairs(programs) do
	hl.bind(APP_MOD .. program.key, hl.dsp.exec_cmd(program.id))
end

local menus = {
	clipboard =   { id = CLIPBOARD,    key = 'V' },
	appLauncher = { id = APP_LAUNCHER, key = 'Space' },
	winSelector = { id = WIN_SELECTOR, key = 'Tab' },
	emojiPicker = { id = EMOJI_PICKER, key = 'E' },
} for _, menu in pairs(menus) do
	hl.bind(MENU_MOD .. menu.key, hl.dsp.exec_cmd(menu.id))
end

-- -- >> screenshotting
hl.bind('Print',         hl.dsp.exec_cmd(SCREENSHOT_WIN), { long_press = true })
hl.bind('SHIFT + Print', hl.dsp.exec_cmd(SCREENSHOT_REG))
