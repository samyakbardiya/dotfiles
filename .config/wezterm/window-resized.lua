local wezterm = require("wezterm")

function RECOMPUTE_PADDING(window)
	local window_dims = window:get_dimensions()
	local overrides = window:get_config_overrides() or {}

	if not window_dims.is_full_screen then
		if not overrides.window_padding then
			-- not changing anything
			return
		end
		overrides.window_padding = nil
	else
		-- Use only the middle 33%
		local third = math.floor(window_dims.pixel_width / 3)
		local new_padding = {
			left = third,
			right = third,
			top = 0,
			bottom = 0,
		}
		if overrides.window_padding and new_padding.left == overrides.window_padding.left then
			-- padding is same, avoid triggering further changes
			return
		end
		overrides.window_padding = new_padding
	end
	window:set_config_overrides(overrides)
end

wezterm.on("window-resized", function(window, pane)
	RECOMPUTE_PADDING(window)
end)

wezterm.on("window-config-reloaded", function(window)
	RECOMPUTE_PADDING(window)
end)
