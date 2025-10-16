-- Create key bindings that stick.
return {
    "folke/which-key.nvim",
    opts = {
        spec = {
            {
                mode = { "n", "v" },
                { "<leader>Q", group = "+reload" },
                { "<localLeader>c", group = "+leetcode" },
                { "<localLeader>d", group = "+dart" },
                { "<localLeader>h", group = "+ledger" },
                { "<localLeader>l", group = "+latex" },
                { "<localLeader>p", group = "+python" },
                { "<localLeader>s", group = "+silicon" },
                { "<localLeader>t", group = "+tex" },
            },
        },
    },
}
