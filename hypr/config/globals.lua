APP_MOD =    'SUPER + '
MENU_MOD =   'ALT + '
FOCUS_MOD =  'SUPER + '
MOVE_MOD =   'SUPER + CTRL + '
RESIZE_MOD = 'SUPER + SHIFT + '
LAYOUT_MOD = 'ALT + SHIFT + '

DECREASE_BACKLIGHT = 'XF86MonBrightnessDown'
INCREASE_BACKLIGHT = 'XF86MonBrightnessUp'

DECREASE_VOL = 'XF86AudioLowerVolume'
INCREASE_VOL = 'XF86AudioRaiseVolume'
MUTE_AUD = 'XF86AudioMute'
MUTE_MIC = 'F15'

PRESS_L = 'H'
PRESS_D = 'J'
PRESS_U = 'K'
PRESS_R = 'L'
PRESS_PREV_WORKSPACE = 'semicolon'
PRESS_NEXT_WORKSPACE = 'apostrophe'

CLICK_L = 'mouse:272'               -- left click
CLICK_R = 'mouse:273'               -- right click
CLICK_U = 'mouse:276'               -- front side click
CLICK_D = 'mouse:275'               -- rear side click
CLICK_NEXT_WORKSPACE = 'mouse_down' -- scroll down
CLICK_PREV_WORKSPACE = 'mouse_up'   -- scroll up

MOVE_OFFSET =   16
RESIZE_OFFSET = 16

TERMINAL =     'kitty'
BROWSER =      'zen-browser'
FILE_MANAGER = 'kitty yazi'
SYS_MONITOR =  'kitty btop'

SCREENSHOT_REG = 'hyprshot -m region -o ~/pictures/screenshots'
SCREENSHOT_WIN = 'hyprshot -m window -o ~/pictures/screenshots'
COL_PICKER =     'hyprpicker -a -f hex -n -u 256 -s 10'

CLIPBOARD =    'cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy'
APP_LAUNCHER = 'rofi -show drun'
WIN_SELECTOR = 'rofi -show window'
EMOJI_PICKER = 'rofi -modi emoji -show emoji'
