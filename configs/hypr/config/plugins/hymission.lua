hl.bind("SUPER + Tab", hl.plugin.hymission.toggle)

hl.bind("SUPER + A", function()
	hl.plugin.hymission.toggle("forceall")

end)
hl.bind("SUPER + S", function()
	hl.plugin.hymission.open("onlycurrentworkspace")
end)

hl.bind("SUPER + Escape", hl.plugin.hymission.close)
