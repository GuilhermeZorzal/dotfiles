local autorun = function ()
    local bufNumber = vim.api.nvim_get_current_buf()
    local fileName = vim.api.nvim_buf_get_name(bufNumber)
    local ext = string.match(fileName, "^.*%.(.*)$")
    local switch = {
	lua = function ()
	    print("Running: ", fileName)
	    return string.format("lua %s", fileName)
	end,
	exs = function ()
	    print("Running: ", fileName)
	    return string.format("elixir %s", fileName)
	end,
	py = function ()
	    print("Running: ", fileName)
	    return string.format("python3 %s", fileName)
	end,
	c = function ()
	    print("Running: ", fileName)
	    return string.format("gcc %s -o run && ./run %s", fileName)
	end,
	sh = function ()
	    print("Running: ", fileName)
	    return string.format("sh %s", fileName)
	end,
    }
    if switch[ext] then
	return switch[ext]()
    else
	if not ext then
	    return "make"
	end
	return 'echo "No executable found for this file type"'
    end
end

vim.keymap.set("n", "<leader>rr", function ()
    vim.cmd("w")
    local valor = string.format("terminal  %s", autorun())
    vim.cmd(valor)
end,
{ desc = "Run file" })

vim.keymap.set("n", "<leader>rs", "<CMD>source %<CR>", { desc = "Resource" })
vim.keymap.set("n", "<leader>x", "<CMD>bd<CR>", { desc = "Debuffer" })
