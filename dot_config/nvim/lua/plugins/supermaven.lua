return {
    -- The official Neovim plugin for Supermaven
    {
        "supermaven-inc/supermaven-nvim",
        enable = false,
        lazy = false,
        opts = {
            keymaps = {
                accept_suggestion = "<C-a>",
                clear_suggestion = "<C-A>",
            },
            ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
            -- disable_inline_completion = false, -- vim.g.ai_cmp,
            -- condition = function()
            --     -- condition to check for stopping, `true` means stop
            --     return true
            -- end,
        },
        config = function(_, opts)
            require("supermaven-nvim").setup({})

            --  --  add ai_accept action
            --  require("supermaven-nvim.completion_preview").suggestion_group = "SupermavenSuggestion"
            --  LazyVim.cmp.actions.ai_accept = function()
            --      local suggestion = require("supermaven-nvim.completion_preview")
            --      if suggestion.has_suggestion() then
            --          LazyVim.create_undo()
            --          vim.schedule(function()
            --              suggestion.on_accept_suggestion()
            --          end)
            --          return true
            --      end
            --  end

            Snacks.toggle({
                name = "Supermaven",
                get = function()
                    return require("supermaven-nvim.api").is_running()
                end,
                set = function(state)
                    if state then
                        require("supermaven-nvim.api").start()
                    else
                        require("supermaven-nvim.api").stop()
                    end
                end,
            }):map("<leader>ux")
        end,
    },
    {
        "saghen/blink.cmp",
        dependencies = {
            {
                "supermaven-inc/supermaven-nvim",
                -- opts = {
                --     disable_inline_completion = vim.g.ai_cmp, -- disables inline completion for use with cmp
                --     disable_keymaps = vim.g.ai_cmp, -- disables built in keymaps for more manual control
                -- },
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
