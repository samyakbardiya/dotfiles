return {

    -- For writing hledger journal
    {
        "anekos/hledger-vim",
        ft = { "ledger" },
    },

    -- Vim plugin for Ledger
    {
        "ledger/vim-ledger",
        lazy = false,
        ft = { "ledger" },
        config = function()
            vim.g.ledger_bin = "hledger"
            vim.g.ledger_is_hledger = true
            vim.g.is_hledger = true
            vim.g.ledger_align_at = 52
        end,
        keys = {
            { "<localLeader>ha", "vip:LedgerAlign<CR>", silent = true, desc = "Align current transaction" },
            { "<localLeader>ha", ":LedgerAlign<CR>", mode = "v", silent = true, desc = "Align Selected" },
            -- {
            --   "<C-i>",
            --   "<Esc>vip:LedgerAlign<CR>i<CR><CR>",
            --   mode = "i",
            --   silent = true,
            --   desc = "Align current transaction",
            -- },
            { "<localLeader>hc", ":silent make | redraw! | cwindow<CR>", silent = true, desc = "Check transactions" },
            {
                "<localLeader>hC",
                ":silent !hledger check ordereddates | redraw! | cwindow<CR>",
                silent = true,
                desc = "Check transactions",
            },
            { "<localLeader>hF", ":LedgerAlignBuffer<CR>", desc = "Align whole File" },
        },
    },
}
