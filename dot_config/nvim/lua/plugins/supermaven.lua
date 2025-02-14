-- The fastest copilot.
return {
    "supermaven-inc/supermaven-nvim",
    enabled = false,
    config = function()
        -- require("supermaven-nvim").setup({})
        local supermaven = require("supermaven-nvim")
        supermaven.setup({})

        local function toggle_supermaven()
            if vim.g.supermaven_enabled == true then
                supermaven.stop()
                vim.g.supermaven_enabled = false
                print("Supermaven disabled")
            else
                supermaven.start()
                vim.g.supermaven_enabled = true
                print("Supermaven enabled")
            end
        end
        vim.api.nvim_create_user_command("ToggleSupermaven", toggle_supermaven, {})

        vim.g.supermaven_enabled = false
    end,
    keys = {
        { "<leader>uS", "<CMD>SupermavenToggle<CR>", desc = "Toggle Supermaven" },
    },
}
