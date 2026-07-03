-- A collection of small QoL plugins for Neovim
return {
    "folke/snacks.nvim",
    opts = {
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
            -- stylua: ignore
            keys = {
                -- { "<leader>f/", LazyVim.pick("grep"), desc = "Grep (Root Dir)" },
            },
            sources = {
                ---@class snacks.picker.explorer.Config
                explorer = {
                    -- auto_close = true,
                    hidden = true,
                },
            },
            win = {
                input = {
                    keys = {
                        ["<a-z>"] = { "toggle_maximize", mode = { "i", "n" } },
                    },
                },
            },
        },
    },
}
