-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_user_command("Rf", function(opts)
  vim.cmd("r !figlet -f ansiShadow " .. opts.args)
end, { nargs = 1 })

local autorun = function()
  local bufNumber = vim.api.nvim_get_current_buf()
  local fileName = vim.api.nvim_buf_get_name(bufNumber)
  local projectDir = vim.fn.fnamemodify(fileName, ":p:h")
  local makefilePath = projectDir .. "/Makefile"

  if vim.fn.filereadable(makefilePath) == 1 then
    vim.cmd("vsplit | terminal make -C " .. projectDir)
  else
    return "No makefile"
  end
end

vim.keymap.set("n", "<leader>rr", function()
  local result = autorun()
  if result then
    print(result)
  end
end, { desc = "Run Makefile in project directory" })

vim.keymap.set("n", "<leader>rs", "<CMD>source %<CR>", { desc = "Resource" })
vim.keymap.set("n", "<leader>x", "<CMD>bd<CR>", { desc = "Debuffer" })

-- quickfix list delete keymap
function Remove_qf_item()
  local curqfidx = vim.fn.line(".")
  local qfall = vim.fn.getqflist()

  -- Return if there are no items to remove
  if #qfall == 0 then
    return
  end

  -- Remove the item from the quickfix list
  table.remove(qfall, curqfidx)
  vim.fn.setqflist(qfall, "r")

  -- Reopen quickfix window to refresh the list
  vim.cmd("copen")

  -- If not at the end of the list, stay at the same index, otherwise, go one up.
  local new_idx = curqfidx < #qfall and curqfidx or math.max(curqfidx - 1, 1)

  -- Set the cursor position directly in the quickfix window
  local winid = vim.fn.win_getid() -- Get the window ID of the quickfix window
  vim.api.nvim_win_set_cursor(winid, { new_idx, 0 })
end

vim.cmd("command! RemoveQFItem lua Remove_qf_item()")
vim.api.nvim_command("autocmd FileType qf nnoremap <buffer> dd :RemoveQFItem<cr>")
vim.keymap.set("n", "dq", function()
  Remove_qf_item()
end, { desc = "Remove_qf_item" })

vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
