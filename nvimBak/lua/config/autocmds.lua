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

-- local autorun = function ()
--     local bufNumber = vim.api.nvim_get_current_buf()
--     local fileName = vim.api.nvim_buf_get_name(bufNumber)
--
--
--     local ext = string.match(fileName, "^.*%.(.*)$")
-- 	  return "make"
-- end

local autorun = function ()
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

vim.keymap.set("n", "<leader>rr", function ()
    local result = autorun()
    if result then
        print(result)
    end
end, { desc = "Run Makefile in project directory" })

vim.keymap.set("n", "<leader>rs", "<CMD>source %<CR>", { desc = "Resource" })
vim.keymap.set("n", "<leader>x", "<CMD>bd<CR>", { desc = "Debuffer" })
