-- Create key bindings that stick.
return {
    "folke/which-key.nvim",
    opts = {
        -- preset = "classic",
        specs = {
            ["<leader>Q"] = { name = "+reload" },
            ["<localLeader>c"] = { name = "+leetcode" },
            ["<localLeader>d"] = { name = "+dart" },
            ["<localLeader>h"] = { name = "+ledger" },
            ["<localLeader>l"] = { name = "+latex" },
            ["<localLeader>p"] = { name = "+python" },
            ["<localLeader>s"] = { name = "+silicon" },
            ["<localLeader>t"] = { name = "+tex" },
        },
    },
}
