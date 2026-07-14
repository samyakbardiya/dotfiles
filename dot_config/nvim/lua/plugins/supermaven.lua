return {
    -- The official Neovim plugin for Supermaven
    {
        "supermaven-inc/supermaven-nvim",
        optional = true,
        lazy = false,
        config = function(_, opts)
            if vim.g.ai_supermaven_cmp then
                require("supermaven-nvim").setup(opts)
            end

            Snacks.toggle({
                name = "Supermaven",
                get = function()
                    if not vim.g.ai_supermaven_cmp then
                        return false
                    end
                    return require("supermaven-nvim.api").is_running() or false
                end,
                set = function(state)
                    if state then
                        require("supermaven-nvim").setup(opts)
                        require("supermaven-nvim.api").start()
                        vim.g.ai_supermaven_cmp = true
                    else
                        require("supermaven-nvim.api").stop()
                        vim.g.ai_supermaven_cmp = false
                    end
                end,
            }):map("<leader>uX")
        end,
    },

    {
        "saghen/blink.cmp",
        dependencies = {
            {
                "supermaven-inc/supermaven-nvim",
                opts = {
                    disable_inline_completion = true,
                    disable_keymaps = true,
                },
            },
            {
                "huijiro/blink-cmp-supermaven",
            },
        },
        opts = {
            sources = {
                default = { "lsp", "path", "supermaven", "snippets", "buffer" },
                providers = {
                    supermaven = {
                        name = "supermaven",
                        module = "blink-cmp-supermaven",
                        async = true,
                    },
                },
            },
        },
    },
}
