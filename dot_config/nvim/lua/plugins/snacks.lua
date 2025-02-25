-- A collection of small QoL plugins for Neovim
return {
    "folke/snacks.nvim",
    opts = {
        ---@class snacks.notifier.Config
        notifier = {
            top_down = false,
        },
        picker = {
            sources = {
                ---@class snacks.picker.explorer.Config
                explorer = {
                    -- auto_close = true,
                    hidden = true,
                },
            },
        },
    },
}
