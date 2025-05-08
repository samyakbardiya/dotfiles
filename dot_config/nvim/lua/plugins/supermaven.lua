-- The official Neovim plugin for Supermaven
return {
    "supermaven-inc/supermaven-nvim",
    opts = {
        keymaps = {
            accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
        },
        ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
        disable_inline_completion = true, -- vim.g.ai_cmp,
        condition = function()
            -- condition to check for stopping supermaven, `true` means to stop
            -- supermaven when the condition is true.
            -- return false
            return true
        end,
    },
    config = function(_, opts)
        require("supermaven-nvim").setup(opts)
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
}
