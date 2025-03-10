return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup{
			vim.keymap.set("n", "<C-q>", "<cmd>NvimTreeToggle<CR>"),
		}
	end,
}
