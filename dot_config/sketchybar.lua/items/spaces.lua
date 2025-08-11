local settings = require("dot_config.sketchybar.settings")

local spaces = {}

for i = 1, 10, 1 do
	local space = Sbar.add("space", "space." .. i, {
		space = i,
		icon = {
			string = i,
			font = { family = settings.font.family.numbers },
			padding_left = 7,
			padding_right = 7,
		},
		label = {
			drawing = false,
			-- font = "sketchybar-app-font:Regular:16.0",
		},
		background = {
			color = "0x40ffffff",
			corner_radius = 5,
		},
	})

	spaces[i] = space

	space:subscribe("space_change", function(env)
		local selected = env.SELECTED == "true"
		local color = selected and colors.grey or colors.bg2
		space:set({
			icon = { highlight = selected },
			label = { highlight = selected },
			background = { drawing },
		})
	end)

	space:subscribe("mouse.clicked", function(env)
		if env.BUTTON == "other" then
			space_popup:set({ background = { image = "space." .. env.SID } })
			space:set({ popup = { drawing = "toggle" } })
		else
			local op = (env.BUTTON == "right") and "--destroy" or "--focus"
			sbar.exec("yabai -m space " .. op .. " " .. env.SID)
		end
	end)

	space:subscribe("mouse.exited", function(_)
		space:set({ popup = { drawing = false } })
	end)
end
