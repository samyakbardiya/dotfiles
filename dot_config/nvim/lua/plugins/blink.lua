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
            -- autocomplete natural dates and turm them into ISO dates
            { "Gelio/cmp-natdat", config = true },
        },
        opts = {
            sources = {
                compat = {
                    "natdat",
                },
                providers = {
                    natdat = { name = "natdat" },
                },
            },
            keymap = {
                preset = "default",
                -- ["Tab"] = { "fallback" },
                -- ["C-Tab"] = { LazyVim.cmp.map({ "snippet_forward", "ai_accept" }), "fallback" },
                ["<C-a>"] = { "select_and_accept" },
                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },
            },
        },
    },
}
