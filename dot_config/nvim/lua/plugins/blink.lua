return {
    {
        -- Performant, batteries-included completion plugin for Neovim
        "saghen/blink.cmp",
        opts = {
            completion = {
                trigger = {
                    show_on_keyword = false,
                },
                documentation = { auto_show = true, auto_show_delay_ms = 500 },
            },
            keymap = {
                preset = "none",
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide", "fallback" },
                ["<C-a>"] = { "select_and_accept", "fallback" },
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
                ["<C-n>"] = { "select_next", "fallback_to_mappings" },
                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },
                ["<Tab>"] = { "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "snippet_backward", "fallback" },
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },

            sources = {
                compat = {
                    "natdat",
                },
                providers = {
                    natdat = { name = "natdat" },
                },
            },
        },
        dependencies = {
            -- autocomplete natural dates and turm them into ISO dates
            { "Gelio/cmp-natdat", config = true },
        },
    },
    {
        -- Compatibility layer for using nvim-cmp sources on blink.cmp
        "saghen/blink.compat",
        lazy = true,
        opts = {},
        version = not vim.g.lazyvim_blink_main and "*",
    },
}
