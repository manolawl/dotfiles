weights = {"red": 0.65, "green": 0.55, "blue": 1}
boosts  = {"red": 3, "green": 3.5, "blue": 2.15}

brightness = {"dark": 0.5, "neutral": 1, "light": 1.5}
idx = {"red": 0, "green": 1, "blue": 2}

pairs = {
    "ruby": ("red",),
    "spinel": ("red","blue"),
    "sapphire": ("blue",),
    "turquoise": ("green","blue"),
    "peridot": ("green",),
    "citrine": ("red","green"),
}

mixes = {
    "rhodolite": ("ruby","spinel"),
    "tanzanite": ("sapphire","spinel"),
    "aquamarine": ("sapphire","turquoise"),
    "tourmaline": ("turquoise","peridot"),
    "emerald": ("peridot","citrine"),
    "spessartine": ("ruby","citrine"),
}

def clamp(x):
    return round(min(x,255))

def avg(a,b):
    return tuple(round((a[i]+b[i])/2) for i in range(3))

def hexrgb(r,g,b):
    return f"#{r:02x}{g:02x}{b:02x}"

w_sum = sum(weights.values())

for level, br in brightness.items():
    print(f"\n/* ==== {level.upper()} COLORS ==== */\n")

    base = br * 255 / w_sum
    baseCh  = {c: clamp(base*w) for c,w in weights.items()}
    boostCh = {c: clamp(base*weights[c]*boosts[c]) for c in weights}

    # Base colors
    colors = {}
    for name, chs in pairs.items():
        rgb = [baseCh["red"], baseCh["green"], baseCh["blue"]]
        for c in chs:
            rgb[idx[c]] = boostCh[c]
        colors[name] = tuple(rgb)

    # Mixed colors
    colors.update({
        n: avg(colors[a], colors[b])
        for n,(a,b) in mixes.items()
    })

    # Special shades
    shades = {
        "amethyst": tuple(baseCh[c] for c in weights),
        "diamond": tuple(boostCh[c] for c in weights),
    }

    # Output grouped CSS
    for name, (r,g,b) in {**shades, **colors}.items():
        print(f"@define-color {name}-{level} rgb({r}, {g}, {b}); /* {hexrgb(r,g,b)} */")
