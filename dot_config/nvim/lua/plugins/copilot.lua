-- Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
        copilot_model = "gpt-4o-copilot",
    },
    config = function()
        require("copilot").setup()
        Snacks.toggle({
            name = "Github Copilot",
            get = function()
                -- if not vim.g.copilot_enabled then
                --     return false
                -- end
                return not require("copilot.client").is_disabled()
            end,
            set = function(state)
                if state then
                    require("copilot").setup()
                    require("copilot.command").enable()
                    -- vim.g.copilot_enabled = true
                else
                    require("copilot.command").disable()
                    -- vim.g.copilot_enabled = false
                end
            end,
        }):map("<leader>ux")
    end,
}
