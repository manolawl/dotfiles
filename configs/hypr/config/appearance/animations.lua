hl.config({ animations = { enabled = true } })

hl.curve('boost',  { type = 'bezier', points = { {0.75, 0.00}, {0.25, 0.50} } })
hl.curve('linear', { type = 'bezier', points = { {0.00, 0.00}, {1.00, 1.00} } })

hl.curve('decel', { type = 'bezier', points = { {0.00, 0.00}, {0.00, 1.00} } })
hl.curve('accel', { type = 'bezier', points = { {1.00, 0.00}, {1.00, 1.00} } })

hl.animation({ leaf = 'global', enabled = true, speed = 0.50, bezier = 'linear', })
hl.animation({ leaf = 'border', enabled = true, speed = 4.50, bezier = 'decel', })

hl.animation({ leaf = 'windowsMove', enabled = true, speed = 2.50, bezier = 'decel', })
hl.animation({ leaf = 'windowsIn',   enabled = true, speed = 2.50, bezier = 'decel', style = 'slide', })
hl.animation({ leaf = 'windowsOut',  enabled = true, speed = 2.50, bezier = 'accel', style = 'slidefade 100%', })

hl.animation({ leaf = 'workspaces', enabled = true, speed = 2.50, bezier = 'decel', style = 'slidefadevert', })

hl.animation({ leaf = 'layers', enabled = true, speed = 1.50, bezier = 'decel', style = 'slidefade', })

hl.animation({ leaf = 'fadeIn',        enabled = true, speed = 3.00, bezier = 'boost', })
hl.animation({ leaf = 'fadeOut',       enabled = true, speed = 3.00, bezier = 'decel', })
hl.animation({ leaf = 'fadeLayersIn',  enabled = true, speed = 2.50, bezier = 'boost', })
hl.animation({ leaf = 'fadeLayersOut', enabled = true, speed = 2.50, bezier = 'decel', })
hl.animation({ leaf = 'fadePopupsIn',  enabled = true, speed = 1.50, bezier = 'decel', })
hl.animation({ leaf = 'fadePopupsOut', enabled = true, speed = 1.50, bezier = 'decel', })


