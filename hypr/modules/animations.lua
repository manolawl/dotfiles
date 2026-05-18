hl.config({ animations = { enabled = true } })

hl.curve("bounce", { type = "bezier", points = { {0.5, 1.5}, {0.5, -0.5} } })
hl.curve("boost", { type = "bezier", points = { {1, 0}, {0, 0} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })

hl.animation({ enabled = true, speed = 2.5, bezier = "boost", leaf = "global" })
hl.animation({ enabled = true, speed = 2, bezier = "linear", leaf = "windowsIn", style = "slide" })
hl.animation({ enabled = true, speed = 2, bezier = "linear", leaf = "windowsOut", style = "slide" })
hl.animation({ enabled = true, speed = 2.5, bezier = "boost", leaf = "windowsMove" })

hl.animation({ enabled = true, speed = 4, bezier = "boost", leaf = "fadeIn" })
hl.animation({ enabled = true, speed = 2.5, bezier = "linear", leaf = "fadeOut" })
