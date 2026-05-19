hl.config({ animations = { enabled = true } })

hl.curve('bounce', { type = 'bezier', points = { {0.5, 1.5}, {0.5, -0.5} } })
hl.curve('boost', { type = 'bezier', points = { {1, 0}, {0, 0} } })
hl.curve('linear', { type = 'bezier', points = { {0, 0}, {1, 1} } })
hl.curve('bow', { type = 'bezier', points = { {0, 0}, {0, 1} } })
hl.curve('wob', { type = 'bezier', points = { {1, 0}, {1, 0} } })

hl.animation({ enabled = true, speed = 5, bezier = 'linear', leaf = 'global' })
hl.animation({ enabled = true, speed = 2, bezier = 'bow', leaf = 'windowsIn', style = 'slide' })
hl.animation({ enabled = true, speed = 2.5, bezier = 'wob', leaf = 'windowsOut', style = 'slide' })
hl.animation({ enabled = true, speed = 2.5, bezier = 'bow', leaf = 'windowsMove' })

hl.animation({ enabled = true, speed = 1.5, bezier = 'boost', leaf = 'fadeLayersIn' })
hl.animation({ enabled = true, speed = 4.5, bezier = 'bow', leaf = 'fadeLayersOut' })

hl.animation({ enabled = true, speed = 4, bezier = 'bow', leaf = 'fadeIn' })
hl.animation({ enabled = true, speed = 5, bezier = 'bow', leaf = 'fadeOut' })
