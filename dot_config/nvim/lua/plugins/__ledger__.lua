return {
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
            {
                "<localLeader>ha",
                "vip:LedgerAlign<CR>",
                silent = true,
                desc = "Align current transaction",
                ft = "ledger",
            },
            {
                "<localLeader>ha",
                ":LedgerAlign<CR>",
                mode = "v",
                silent = true,
                desc = "Align Selected",
                ft = "ledger",
            },
            -- {
            --   "<C-i>",
            --   "<Esc>vip:LedgerAlign<CR>i<CR><CR>",
            --   mode = "i",
            --   silent = true,
            --   desc = "Align current transaction",
            -- },
            {
                "<localLeader>hc",
                ":silent make | redraw! | cwindow<CR>",
                silent = true,
                desc = "Check transactions",
                ft = "ledger",
            },
            {
                "<localLeader>hC",
                ":silent !hledger check ordereddates | redraw! | cwindow<CR>",
                silent = true,
                desc = "Check transactions",
                ft = "ledger",
            },
            {
                "<localLeader>hF",
                ":LedgerAlignBuffer<CR>",
                desc = "Align whole File",
                ft = "ledger",
            },
            {
                "<localLeader>hh",
                "o<CR>2025-",
                mode = { "n", "v" },
                desc = "Insert new transaction",
                ft = "ledger",
            },
        },
    },

    {
        "saghen/blink.cmp",
        dependencies = { "kirasok/cmp-hledger" },
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            opts.sources.compat = opts.sources.compat or {}
            opts.sources.providers = opts.sources.providers or {}

            vim.list_extend(opts.sources.compat, { "hledger" })
            opts.sources.providers.hledger = { name = "hledger" }

            return opts
        end,
    },
}
