return {
	'stevearc/oil.nvim',
	config = function()
		require("oil").setup{
			view_options = {
			  -- Show files and directories that start with "."
				show_hidden = true,
			  -- This function defines what is considered a "hidden" file
			},
			 keymaps = {
			    ["g?"] = "actions.show_help",
			    ["<CR>"] = "actions.select",
			    ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
			    ["<C-h>"] = { "actions.select", opts = { horizontal = false }, desc = "Open the entry in a horizontal split" },
			    ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
			    ["<C-p>"] = "actions.preview",
			    ["<C-c>"] = "actions.close",
			    ["<C-l>"] = "actions.refresh",
			    ["-"] = "actions.parent",
			    ["_"] = "actions.open_cwd",
			    ["`"] = "actions.cd",
			    ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
			    ["gs"] = "actions.change_sort",
			    ["gx"] = "actions.open_external",
			    ["g."] = "actions.toggle_hidden",
			    ["g\\"] = "actions.toggle_trash",
			  },		-- vim.keymap.set("n", "<C-p>", "<cmd>Oil<CR>"),
		}

	end,
	  -- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
