-- MONITORS
hl.monitor({output = "", mode = "preferred", position = "-1920x0", scale = 1 })
hl.monitor({output = "eDP-1", mode = "1920x1080@165", position = "0x0", scale = 1.333333333 })
hl.monitor({output = "HDMI-A-2", mode = "1920x1080@74.97", position = "-240x-1080", scale = 1 })

local terminal     = "kitty"
local file_manager = "kitty yazi"
local app_launcher = "rofi -show drun"
local browser      = "zen-browser"
local sys_monitor  = "kitty btop"

-- MAIN PROGRAMS
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + space", hl.dsp.exec_cmd(app_launcher))
hl.bind("XF86Presentation", hl.dsp.exec_cmd(sys_monitor))

hl.bind("SUPER + F", hl.dsp.window.float({ action = toggle }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ action = toggle }))
hl.bind("SUPER + Q", hl.dsp.window.kill())
hl.bind("SUPER + Escape", hl.dsp.exec_cmd("hyprlock"))

-- WINDOW FOCUSING
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

-- THEME
hl.env("GTK_THEME", "oomox-Geminal")
hl.env("XCURSOR_THEME", "capitaine-cursors")
--hl.env("HYPRCURSOR_THEME", "rose-pine-cursor")
hl.env("XCURSOR_SIZE", "28")
hl.env("HYPRCURSOR_SIZE", "28")

-- QT
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
--hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
--hl.env("OOMOX_QTSTYLEPLUGIN", "oomox-geminal qt-app-name")

--XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- NVIDIA
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")

-- TOOLKIT BACKEND
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("GDK_BACKEND", "wayland")

-- AQUAMARINE
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")
--hl.env("AQ_TRACE", "1")
--hl.env("AQ_FORCE_LINEAR_BLIT", "0")
--hl.env("AQ_MGPU_NO_EXPLICIT", "1")
--hl.env("AQ_NO_MODIFIERS", "1")

-- MISCELLANEOUS
--hl.env("HYPRSHOT_DIR", "~/screenshots")
hl.env("GRIM_DEFAULT_DIR", "~/screenshots")
--hl.env("EDITOR", "vim")
hl.env("EDITOR", "nvim")

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",
		accel_profile = "flat",
		follow_mouse = 1,
		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.5,
		},
		repeat_delay = 250,
		sensitivity = 0
	},

	misc = {
		disable_hyprland_logo = true,
		font_family = "JetBrainsMono Nerd Font",
		force_default_wallpaper = 0,
	},

	ecosystem = { enforce_permissions = true },
	quirks = { prefer_hdr = 2 },
	render = { direct_scanout = 0 },
	animations = { enabled = true },

	general = {
		gaps_in = 4,
		gaps_out = 8,
		border_size = 2,
		resize_on_border = false,
		allow_tearing = true,
		layout = "dwindle",

		col = {
			active_border = {
				angle = 0,
				colors = {
					"rgba(000000bf)",
					"rgb(e240f9)",
					"rgb(e24074)",
					"rgb(e29074)",
					"rgb(97df74)",
					"rgb(4bdf74)",
					"rgb(4bdff9)",
					"rgb(4b90f9)",
					"rgb(9740f9)",
					"rgba(000000bf)"
				}
			},
			inactive_border = "rgba(000000bf)"
		}
	},

	decoration = {
		rounding = 4,
		rounding_power = 2,
		active_opacity = 1,
		inactive_opacity = 1,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 2,
			color = "rgb(202020)"
		},

		blur {
			enabled = true,
			size = 4,
			passes = 2,
			vibrancy = 0
		}
	},

	dwindle = {
		pseudotile = true,
		preserve_split = true
	},

	scrolling = {
		fullscreen_on_one_column = true,
		focus_fit_method = 0,
		column_width = 0.666666666,
		direction = right,
	},

	xwayland = {
		enabled = true,
		force_zero_scaling = true,
		use_nearest_neighbor = true
	},

	cursor = {
		default_monitor = "eDP-1",
		no_hardware_cursors = 1
	}
})

-- PERMISSIONS
hl.permission({ binary = "usr/sbin/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "usr/sbin/slurp", type = "screencopy", mode = "allow" })
hl.permission({ binary = "usr/sbin/hyprpicker", type = "screencopy", mode = "allow" })
hl.permission({ binary = "usr/(lib|libexec|lib64)/", type = "screencopy", mode = "allow" })

-- STARTUP
hl.on("hyprland.start", function()
	hl.exec_cmd("./dotfiles/scripts/walls_shuffler.sh")
	hl.exec_cmd("waybar")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("udiskie")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)


