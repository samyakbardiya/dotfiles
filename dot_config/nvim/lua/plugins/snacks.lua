-- A collection of small QoL plugins for Neovim
return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        ---@class snacks.explorer.Config
        explorer = {
            trash = true,
        },
        ---@class snacks.notifier.Config
        notifier = {
            top_down = false,
        },
        picker = {
            preset = "ivy",
            layout = {
                height = 1,
                width = 1,
            },
            sources = {
                explorer = {
                    -- auto_close = true,
                    hidden = true,
                },
            },
            win = {
                input = {
                    keys = {
                        ["M"] = { "toggle_maximize", mode = { "n" } },
                    },
                },
            },
        },
    },
}
