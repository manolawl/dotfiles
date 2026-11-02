--modifiers
FocusMod =  'SUPER + '
AppMod =    'SUPER + '
MoveMod =   'SUPER + CTRL + '
ResizeMod = 'SUPER + SHIFT + '
MenuMod =   'ALT + '
LayoutMod = 'ALT + SHIFT + '

--vim motions
DirL = 'H'
DirD = 'J'
DirU = 'K'
DirR = 'L'

--button used when mouse in hand (used only in moving and resizing windows)
MainMouseBtn = 'mouse:272' --left click

PixelChange = 8 --how many pixels to move or resize via keybinds

--pixel widths between windows and monitor edges respectively
InnerGap = 8
OuterGap = 16

--roundness of window corners
RoundValue = 8
RoundPower = 2

BlurSize = 4
BlurPass = 2

DefaultLayout = 'scrolling'
WorkspaceTotal = 3

require('./config/input/devices')
require('./config/input/laptop')
require('./config/input/run')
require('./config/input/wm')

require('./config/appearance/animations')
require('./config/appearance/monitors')
require('./config/appearance/layouts')
require('./config/appearance/windows')

require('./config/system/environment')
require('./config/system/events')
require('./config/system/permissions')
require('./config/system/rules')
