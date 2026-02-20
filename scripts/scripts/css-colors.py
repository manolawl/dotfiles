weights = {
    "red": 0.65,
    "green": 0.55,
    "blue": 1,
}

boosts = {
    "red": 3,
    "green": 3.5,
    "blue": 2.15,
}

def clamp(x):
    return(round(min(x, 255)))

def avgColor(rgb1, rgb2):
    return tuple(round((rgb1[i] + rgb2[i]) / 2) for i in range(3))

base = 255 / sum(weights.values())

baseCh = {ch: clamp(base * weight) for ch, weight in weights.items()}
boostCh = {ch: clamp(base * weights[ch] * boosts[ch]) for ch in weights}

shades = {
    "dark": (baseCh["red"], baseCh["green"], baseCh["blue"]),
    "light": (boostCh["red"], boostCh["green"], boostCh["blue"]),
}

colors = {
    "red": (boostCh["red"], baseCh["green"], baseCh["blue"]),
    "magenta": (boostCh["red"], baseCh["green"], boostCh["blue"]),
    "blue": (baseCh["red"], baseCh["green"], boostCh["blue"]),
    "cyan": (baseCh["red"], boostCh["green"], boostCh["blue"]),
    "green": (baseCh["red"], boostCh["green"], baseCh["blue"]),
    "yellow": (boostCh["red"], boostCh["green"], baseCh["blue"]),
}

mixes = {
    "rose": (avgColor(colors["red"], colors["magenta"])),
    "violet": (avgColor(colors["blue"], colors["magenta"])),
    "sky": (avgColor(colors["blue"], colors["cyan"])),
    "jade": (avgColor(colors["cyan"], colors["green"])),
    "lime": (avgColor(colors["green"], colors["yellow"])),
    "pumpkin": (avgColor(colors["red"], colors["yellow"])),
}

allColors = {**shades, **colors, **mixes}

for color, (r, g, b) in allColors.items():
    print(f"@define-color {color} rgb({r}, {g}, {b});")
