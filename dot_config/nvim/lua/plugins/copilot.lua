-- Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
            help = false,
            ledger = false,
            markdown = true,
        },
    },
    config = function()
        local copilot = require("copilot")
        copilot.setup({})

        local function toggle_copilot()
            if vim.g.copilot_enabled == true then
                vim.cmd("Copilot disable")
                vim.g.copilot_enabled = false
                print("Copilot disabled")
            else
                vim.cmd("Copilot enable")
                vim.g.copilot_enabled = true
                print("Copilot enabled")
            end
        end
        vim.api.nvim_create_user_command("ToggleCopilot", toggle_copilot, {})
    end,
    keys = {
        { "<leader>uG", "<CMD>ToggleCopilot<CR>", desc = "Toggle Copilot" },
    },
}
