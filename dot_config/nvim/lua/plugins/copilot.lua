-- Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
return {
    "zbirenbaum/copilot.lua",
    -- cmd = "Copilot",
    -- build = ":Copilot auth",
    -- optional = true,
    opts = {
        -- copilot_model = "gpt-4o-copilot", -- "",
        copilot_node_command = vim.fn.expand("$FNM_DIR") .. "/aliases/latest/bin/node",
    },
    config = function(_, opts)
        if vim.g.ai_copilot_enabled then
            require("copilot.api").status = require("copilot.status")
            require("copilot").setup(opts)
        end
        Snacks.toggle({
            name = "Github Copilot",
            get = function()
                if not vim.g.ai_copilot_enabled then
                    return false
                end
                return not require("copilot.client").is_disabled()
            end,
            set = function(state)
                if state then
                    require("copilot").setup(opts)
                    require("copilot.command").enable()
                    vim.g.ai_copilot_enabled = true
                else
                    require("copilot.command").disable()
                    vim.g.ai_copilot_enabled = false
                end
            end,
        }):map("<leader>ux")
    end,
}
