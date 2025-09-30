-- Soothing pastel theme for (Neo)vim
return {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    -- version = "^1.11.0",
    opts = {
        transparent_background = false,
        show_end_of_buffer = true,
        dim_inactive = {
            enabled = true,
        },
        styles = {
            comments = {},
            conditionals = {},
            strings = { "italic" },
        },
        integrations = {
            blink_cmp = true,
            copilot_vim = true,
            dap = true,
            dap_ui = true,
            fzf = true,
            gitsigns = true,
            grug_far = true,
            harpoon = true,
            lsp_trouble = true,
            mason = true,
            mini = { enabled = true },
            neotree = true,
            noice = true,
            octo = true,
            rainbow_delimiters = true,
            snacks = { enabled = true },
            telescope = { enabled = true },
            treesitter = true,
            treesitter_context = true,
            which_key = true,

            -- dropbar = {
            --     enabled = true,
            --     color_mode = false, -- enable color for kind's texts, not just kind's icons
            -- },
            -- ts_rainbow2 = true,
        },
    },
}
