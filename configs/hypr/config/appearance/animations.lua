hl.config({ animations = { enabled = true } })

hl.curve('bounce', { type = 'bezier', points = { {0.5, 1.5}, {0.5, -0.5} } })
hl.curve('boost',  { type = 'bezier', points = { {1.0, 0.0}, {0.0,  0.0} } })
hl.curve('linear', { type = 'bezier', points = { {0.0, 0.0}, {1.0,  1.0} } })
hl.curve('bow',    { type = 'bezier', points = { {0.0, 0.0}, {0.0,  1.0} } })
hl.curve('wob',    { type = 'bezier', points = { {1.0, 0.0}, {1.0,  0.0} } })

hl.animation({ leaf = 'global',      enabled = true, speed = 0.5, bezier = 'linear', })

hl.animation({ leaf = 'windowsMove', enabled = true, speed = 1.5, bezier = 'bow', })
hl.animation({ leaf = 'windowsIn',   enabled = true, speed = 1.0, bezier = 'bow', style = 'slide', })
hl.animation({ leaf = 'windowsOut',  enabled = true, speed = 2.5, bezier = 'wob', style = 'gnomed', })

hl.animation({ leaf = 'workspacesIn',  enabled = true, speed = 1.0, bezier = 'bow', style = 'slidevert', })
hl.animation({ leaf = 'workspacesOut', enabled = true, speed = 2.5, bezier = 'wob', style = 'slidevert', })

hl.animation({ leaf = 'fadeLayersIn',  enabled = true, speed = 3.0, bezier = 'boost', })
hl.animation({ leaf = 'fadeLayersOut', enabled = true, speed = 3.0, bezier = 'bow', })

hl.animation({ leaf = 'fadeIn',  enabled = true, speed = 3.0, bezier = 'boost', })
hl.animation({ leaf = 'fadeOut', enabled = true, speed = 3.0, bezier = 'bow', })

hl.animation({ leaf = 'border', enabled = true, speed = 2.5, bezier = 'bounce', })
