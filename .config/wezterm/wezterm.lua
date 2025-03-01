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
config.font_size = 11.5
config.font = wezterm.font_with_fallback({
	"MonaspiceNe Nerd Font", -- NOTE: No support for ligatures :(
	-- "Fira Code",
	-- { family = "FiraCode Nerd Font", harfbuzz_features = { "ss02", "zero" } },
	{ family = "Symbols Nerd Font", scale = 0.75 },
})

------------
-- WINDOW --
------------
config.window_background_opacity = 0.9
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "NONE"
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

-- --------------------
-- -- CENTER PADDING --
-- --------------------
-- function DUMP(o)
-- 	if type(o) == "table" then
-- 		local s = "{ "
-- 		for k, v in pairs(o) do
-- 			if type(k) ~= "number" then
-- 				k = '"' .. k .. '"'
-- 			end
-- 			s = s .. "[" .. k .. "] = " .. DUMP(v) .. ","
-- 		end
-- 		return s .. "} "
-- 	else
-- 		return tostring(o)
-- 	end
-- end
--
-- local center_content = function(window, pane)
-- 	local counter = 0
--
-- 	local win_dims = window:get_dimensions()
-- 	counter = counter + 1
-- 	wezterm.log_info(counter .. " win-dims: " .. win_dims.pixel_width .. "x" .. win_dims.pixel_height)
-- 	-- wezterm.log_info(counter .. " win-dims: " .. DUMP(win_dims))
-- 	local tab_dims = pane:get_dimensions()
-- 	counter = counter + 1
-- 	wezterm.log_info(counter .. " tab-dims: " .. tab_dims.pixel_width .. "x" .. tab_dims.pixel_height)
-- 	-- wezterm.log_info(counter .. " tab-dims: " .. DUMP(tab_dims))
-- 	local overrides = window:get_config_overrides() or {}
-- 	if overrides.window_padding then
-- 		counter = counter + 1
-- 		wezterm.log_info(
-- 			counter .. " CUR-padd: " .. overrides.window_padding.left .. "x" .. overrides.window_padding.top
-- 		)
-- 	end
--
-- 	local new_padding = {
-- 		left = math.floor((win_dims.pixel_width - tab_dims.pixel_width) / 2),
-- 		right = 0,
-- 		top = math.floor((win_dims.pixel_height - tab_dims.pixel_height) / 2),
-- 		bottom = 0,
-- 	}
-- 	counter = counter + 1
-- 	wezterm.log_info(counter .. " NEW-padd: " .. new_padding.left .. "x" .. new_padding.top)
-- 	if
-- 		overrides.window_padding
-- 		and new_padding.left == overrides.window_padding.left
-- 		and new_padding.top == overrides.window_padding.top
-- 	then
-- 		counter = counter + 1
-- 		wezterm.log_warn(counter .. " PADDING IS SAME")
-- 		return
-- 	end
-- 	overrides.window_padding = new_padding
--
-- 	window:set_config_overrides(overrides)
-- 	counter = counter + 1
-- 	wezterm.log_warn(counter .. " PADDING UPDATED")
-- end
--
-- wezterm.on("window-resized", center_content)
-- wezterm.on("window-config-reloaded", center_content)

return config
