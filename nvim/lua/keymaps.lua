vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
 vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
 vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
 vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
 vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- 
-- Buffers
vim.keymap.set("n", "<leader>bs", "<CMD>vsp<CR>", { desc = "[S]plit Windows" })
vim.keymap.set("n", "<leader>bo", "<CMD>enew<CR><CMD>Oil<CR>", { desc = "[O]pen new buffer" })
vim.keymap.set("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "[N]ext buffer" })
vim.keymap.set("n", "<leader>bp", "<CMD>bprev<CR>", { desc = "[P]revious buffer" })
vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", { desc = "[D]elete current buffer" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "" })
vim.keymap.set("n", "<leader>p", "\"+p<CR>", { desc = "" })
vim.keymap.set("n", "<leader>y", "\"+y<CR>", { desc = "" })
vim.keymap.set("v", "<leader>y", "\"+y <CR>", { desc = "" })
-- vim.keymap.set("i", "<C-u>", "<nop>", { desc = "" })

vim.keymap.set("n", "<C-j>", "<C-u>", { desc = "" })
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "" })

vim.keymap.set("i", "<C-u>", "<nop>", { desc = "" })
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-W>', { noremap = true, silent = true })



vim.keymap.set('n', '<A>h', '<Cmd>BufferPrevious<CR>', {desc = ""})
vim.keymap.set('n', '<A>l', '<Cmd>BufferNext<CR>', {desc = ""})
-- Re-order to previous/next,
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', {desc = ""})
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', {desc = ""})
-- Goto buffer in position...
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', {desc = ""})
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', {desc = ""})
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', {desc = ""})
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', {desc = ""})
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', {desc = ""})
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', {desc = ""})
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', {desc = ""})
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', {desc = ""})
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', {desc = ""})
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', {desc = ""})
-- Pin/unpin buffer
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', {desc = ""})
-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned
-- Close buffer
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', {desc = ""})
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', {desc = ""})
-- Sort automatically by...
vim.keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', {desc = ""})
vim.keymap.set('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', {desc = ""})
vim.keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', {desc = ""})
vim.keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', {desc = ""})
vim.keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', {desc = ""})
