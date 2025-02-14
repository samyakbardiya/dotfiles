-- fugitive.vim: A Git wrapper so awesome, it should be illegal
return {
    "tpope/vim-fugitive",
    lazy = false,

    -- TODO: Set Keymap
    --
    -- keys = {
    --   { "<leader>gC", ":Git commit<CR>", desc = "Fugitive Commit" },
    -- },
    -- config = function()
    --   vim.cmd([[
    --     nnoremap <leader>gs :Git<CR>
    --     nnoremap <leader>gc :Git commit<CR>
    --     nnoremap <leader>gp :Git push<CR>
    --     nnoremap <leader>gd :Git diff<CR>
    --     nnoremap <leader>gb :Git blame<CR>
    --     nnoremap <leader>gl :Git log<CR>
    --     nnoremap <leader>gj :Git diff master..<CR>
    --     nnoremap <leader>gk :Git diff --cached<CR>
    --   ]])
    -- end
}
