local settings = require("settings")

Sbar.default({
	padding_left = 5,
	padding_right = 5,
	icon = {
		font = {
			family = settings.font.family.text,
			style = settings.font.style["Bold"],
			size = 14,
		},
		padding_left = settings.paddings,
		padding_right = settings.paddings,
	},
	label = {
		font = {
			family = settings.font.family.text,
			style = settings.font.style["SemiBold"],
			size = 13,
		},
		padding_left = settings.paddings,
		padding_right = settings.paddings,
	},
})
