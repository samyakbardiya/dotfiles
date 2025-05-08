-- Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
return {
    "zbirenbaum/copilot.lua",
    -- enabled = false,
    cmd = "Copilot",
    build = ":Copilot auth",
    optional = true,
    opts = {
        copilot_model = "gpt-4o-copilot",
    },
    config = function(_, opts)
        require("copilot.api").status = require("copilot.status")
        require("copilot").setup(opts)
        Snacks.toggle({
            name = "Github Copilot",
            get = function()
                return not require("copilot.client").is_disabled()
            end,
            set = function(state)
                if state then
                    -- require("copilot").setup(opts)
                    require("copilot.command").enable()
                else
                    require("copilot.command").disable()
                end
            end,
        }):map("<leader>uX")
    end,
}
