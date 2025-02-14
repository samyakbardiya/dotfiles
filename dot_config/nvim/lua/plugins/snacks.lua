-- A collection of small QoL plugins for Neovim
return {
    "folke/snacks.nvim",
    opts = {
        ---@class snacks.notifier.Config
        notifier = {
            top_down = false,
        },
    },
}
