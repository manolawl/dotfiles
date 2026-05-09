hl.config({ animations = { enabled = true } })

hl.curve("bounce", { type = "bezier", points = { {0.5, 1.5}, {0.5, -0.5} } })
hl.curve("jump", { type = "bezier", points = { {1, 0}, {0, 0} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })

hl.animation({ enabled = true, speed = 2.5, bezier = "jump", leaf = "global")
