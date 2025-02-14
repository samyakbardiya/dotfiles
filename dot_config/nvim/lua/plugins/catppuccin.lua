-- Soothing pastel theme for (Neo)vim
return {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
        transparent_background = false,
        show_end_of_buffer = true,
        -- dim_inactive = {
        --     enabled = true,
        --     percentage = 0.15,
        -- },
        styles = {
            comments = {},
            conditionals = {},
            strings = { "italic" },
        },
        integrations = {
            dropbar = {
                enabled = true,
                color_mode = false, -- enable color for kind's texts, not just kind's icons
            },
            ts_rainbow2 = true,
        },
    },
}
