-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>t", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })

vim.api.nvim_set_keymap("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })

-- Copy paste
vim.keymap.set("n", "<leader>p", '"+p<CR>', { desc = "Paste from clipBoard" })
vim.keymap.set("n", "<leader>y", 'V"+y<CR>', { desc = "Copy to clipBoard" })
vim.keymap.set("v", "<leader>y", '"+y <CR>', { desc = "Copy to clipBoard" })

-- Scroll
vim.keymap.set("n", "<C-S-J>", "<C-d>", { desc = "Hald page down" })
vim.keymap.set("n", "<C-S-K>", "<C-u>", { desc = "Half page up" })

-- Macros
vim.keymap.set("n", "@q", "Q", { desc = "Execute fast macro" })

-- Disabling keys
vim.keymap.del("n", "<leader>l")

vim.keymap.set("n", "0", "_", { desc = "0 to go to first non null character" })
vim.keymap.set("t", "<c-c>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Moving througth buffers
vim.keymap.set("n", "<M-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<M-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Fast save
vim.keymap.set("v", "<leader><space>", "<cmd>w<CR>", { desc = "Copy to clipBoard" })

-- vim.keymap.set("i", "ç", "<ESC>", { desc = "Escape" })

vim.keymap.set("n", "<c-p>", "<CMD>Oil<CR>", { desc = "Oil" })
-- vim.keymap.set("n", "ci'", 'ci"', { desc = "change" })

vim.keymap.set("n", "gaf", "ggVG", { desc = "Select [A]ll [F]ile" })
