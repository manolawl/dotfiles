--pixel widths between windows and monitor edges respectively
InnerGap = 8
OuterGap = 16

--roundness of window corners
RoundValue = 8
RoundPower = 2

BlurSize = 4
BlurPass = 2

WorkspaceTotal = 3

function notify(msg, font_size, color)
	hl.notification.create({ text = msg, color = color, font_size = font_size, timeout = 1500 })
end

require('./config/input/devices')
require('./config/input/shortcuts')
require('./config/input/wm')

require('./config/appearance/animations')
require('./config/appearance/display')
require('./config/appearance/layouts')
require('./config/appearance/windows')

require('./config/system/environment')
require('./config/system/events')
require('./config/system/permissions')
require('./config/system/rules')
