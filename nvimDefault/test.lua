-- To create plugins, create a function fisrt
function Todo() print("TODO") end

-- this creates a user function that can be run through :Todo
vim.api.nvim_create_user_command("Todo", Todo, {})

-- Auto commands: calls the funtion when the event is triggered
-- vim.api.nvim_create_autocmd("CursorHold", {callback = Todo})
vim.keymap.set("n", "<C-p>", ":Todo<CR>")


