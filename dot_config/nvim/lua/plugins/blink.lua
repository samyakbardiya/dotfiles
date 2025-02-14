return {
    {
        -- Compatibility layer for using nvim-cmp sources on blink.cmp
        "saghen/blink.compat",
        lazy = true,
        opts = {},
        version = not vim.g.lazyvim_blink_main and "*",
    },
    {
        -- Performant, batteries-included completion plugin for Neovim
        "saghen/blink.cmp",
        dependencies = {
            "Gelio/cmp-natdat",
            "kirasok/cmp-hledger",
        },
        opts = {
            sources = {
                compat = { "hledger", "natdat" },
                providers = {
                    hledger = { name = "hledger" },
                    natdat = { name = "natdat" },
                },
            },
            keymap = {
                preset = "default",
                ["<C-a>"] = { "select_and_accept" },
                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },
            },
        },
    },
}
