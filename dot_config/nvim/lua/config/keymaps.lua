-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- -- Helper function to reduce bloat
-- local function map(mode, lhs, rhs, opts)
--   local keys = require("lazy.core.handler").handlers.keys
--   ---@cast keys LazyKeysHandler
--   -- do not create the keymap if a lazy keys handler exists
--   if not keys.active[keys.parse({ lhs, mode = mode }).id] then
--     opts = opts or {}
--     opts.silent = opts.silent ~= false
--     if opts.remap and not vim.g.vscode then
--       opts.remap = nil
--     end
--     vim.keymap.set(mode, lhs, rhs, opts)
--   end
-- end
--
-- map("n", "<leader>bX", "<cmd>BufferLineCloseOthers<cr>", { desc = "Delete other buffers" })

vim.keymap.set("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = true })

vim.keymap.set("n", "<leader>Qr", "<cmd>source %<cr>", { desc = "Reload current file" })
vim.keymap.set("n", "<leader>QR", "<cmd>source $XDG_CONFIG_HOME/nvim/init.lua<cr>", { desc = "Reload Neovim config" })

vim.keymap.set("n", "<leader><CR>", LazyVim.pick("files", { root = false, desc = "Find Files (cwd)" }))

-- local java_snippets = {
--   ["logfac"] = {
--     prefix = "logfac",
--     body = {
--       "private final Logger logger = LoggerFactory.getLogger(${TM_FILENAME_BASE}.class);",
--     },
--     description = "Create a logger instance",
--   },
-- }
