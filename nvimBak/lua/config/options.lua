-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false

vim.g.ai_cmp = false

local opt = vim.opt

opt.autowrite = false -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
-- opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system
opt.clipboard = ""

vim.opt.scrolloff = 25
vim.wo.linebreak = true
vim.wo.wrap = true
vim.g.autoformat = false
