local wezterm = require("wezterm")

local config = {}

-------------
-- OPTIONS --
-------------

config.color_scheme = "Catppuccin Mocha" -- "Gruvbox dark, medium (base16)"
config.command_palette_font_size = 12.0
config.cursor_thickness = 2.0
config.default_cursor_style = "SteadyUnderline"
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = false
config.underline_position = -4.0
config.underline_thickness = 2.0
config.use_resize_increments = false
-- config.command_palette_rows = 10

--------------
-- LIGATURE --
--------------
-- ss01: == === =/= != !== /= /== ~~ =~ !~
-- ss02: >= <=
-- ss03: -> <- => <!-- --> <~ <~~ ~> ~~> <~>
-- ss04: </ /> </> /\ \/
-- ss05: |> <|
-- ss06: ## ###
-- ss07: *** /* */ /*/ (* *) (*)
-- ss08: .= .- ..<
local ligature = { "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "ss12", "zero" }

----------
-- FONT --
----------
config.font_size = 16
config.font = wezterm.font_with_fallback({
	-- "Input Mono",
	-- "Monaspace Neon", -- calming
	-- "Fira Code",
	-- { family = "Input", harfbuzz_features = { "ss12" } }, -- ===
	{ family = "Monaspace Neon", harfbuzz_features = ligature },
	-- { family = "Fira Code", harfbuzz_features = ligature },
	{ family = "Symbols Nerd Font", scale = 0.75 },
})
-- config.cell_width = 0.69

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
