-- THEME
hl.env("GTK_THEME", "oomox-Geminal")
hl.env("XCURSOR_THEME", "capitaine-cursors")
--hl.env("HYPRCURSOR_THEME", "rose-pine-cursor")
hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_SIZE", "32")

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

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
