local wezterm = require("wezterm")
local config = {}

-------------
-- OPTIONS --
-------------
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Gruvbox dark, medium (base16)"

config.command_palette_font_size = 12.0
-- config.command_palette_rows = 10

config.cursor_thickness = 2.0

config.default_cursor_style = "SteadyUnderline"

config.hide_tab_bar_if_only_one_tab = true

config.switch_to_last_active_tab_when_closing_tab = false

config.underline_position = -4.0
config.underline_thickness = 2.0

config.use_resize_increments = false

----------
-- FONT --
----------
config.font_size = 16
config.font = wezterm.font_with_fallback({
	"Input Mono",
	-- "MonaspiceNe Nerd Font",
	-- "Fira Code",
	-- { family = "FiraCode Nerd Font", harfbuzz_features = { "ss02", "zero" } },
	{ family = "Symbols Nerd Font", scale = 0.75 },
})

------------
-- WINDOW --
------------
config.window_background_opacity = 0.9
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_frame = {
	font = wezterm.font({ family = "MonaspiceKr Nerd Font", weight = "Bold" }),
	font_size = 8.0,
}
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
-- config.window_padding = { left = "1cell", right = "1cell", top = "0.5cell", bottom = "0.5cell" }

------------------
-- KEY BINDINGS --
------------------
config.keys = {
	{ key = "a", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },
}

return config
