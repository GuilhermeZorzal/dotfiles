-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>t", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })

vim.api.nvim_set_keymap("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })

local term_buf = nil
local term_win = nil

function TermToggle()
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.cmd("hide")
  else
    if width / 3 > height then
      vim.cmd("botright vnew")
      vim.cmd("vertical-resize " .. width * 0.6)
    else
      vim.cmd("botright new")
      vim.cmd("resize " .. height * 0.4)
    end
    -- vim.cmd("botright new")
    local new_buf = vim.api.nvim_get_current_buf()
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      vim.cmd("buffer " .. term_buf) -- go to terminal buffer
      vim.cmd("bd " .. new_buf) -- cleanup new buffer
    else
      vim.cmd("terminal")
      term_buf = vim.api.nvim_get_current_buf()
      vim.wo.number = false
      vim.wo.relativenumber = false
      vim.wo.signcolumn = "no"
      vim.fn.chansend(vim.b.terminal_job_id, "cd " .. vim.fn.getcwd() .. " && clear\n")
    end
    vim.cmd("startinsert!")
    term_win = vim.api.nvim_get_current_win()
  end
end

vim.keymap.set("n", "<leader>p", '"+p<CR>', { desc = "Paste from clipBoard" })
vim.keymap.set("n", "<leader>y", 'V"+y<CR>', { desc = "Copy to clipBoard" })
vim.keymap.set("v", "<leader>y", '"+y <CR>', { desc = "Copy to clipBoard" })

-- toggle copilot suggestions
vim.keymap.set("n", "<leader>at", function()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
end, { desc = "Toggle copilot" })

--  ____       _      _           _   _
-- |  _ \  ___| | ___| |_ ___  __| | | | _____ _   _ _ __ ___   __ _ _ __  ___
-- | | | |/ _ \ |/ _ \ __/ _ \/ _` | | |/ / _ \ | | | '_ ` _ \ / _` | '_ \/ __|
-- | |_| |  __/ |  __/ ||  __/ (_| | |   <  __/ |_| | | | | | | (_| | |_) \__ \
-- |____/ \___|_|\___|\__\___|\__,_| |_|\_\___|\__, |_| |_| |_|\__,_| .__/|___/
--                                             |___/                |_|
vim.keymap.del("n", "<leader>l")


vim.keymap.set("n", "ç",":")
