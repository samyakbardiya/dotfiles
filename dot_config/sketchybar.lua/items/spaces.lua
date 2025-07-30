local settings = require("dot_config.sketchybar.settings")
local spaces = {}

for i = 1, 10, 1 do
	local space = Sbar.add("space", "space." .. i, {
		space = 1,
		icon = {
			string = i,
			font = { family = settings.font.family.numbers },
			padding_left = 7,
			padding_right = 7,
		},
		label = {
			drawing = false,
		},
		background = {
			color = "0x40ffffff",
			corner_radius = 5,
		},
	})

	spaces[i] = space
end
