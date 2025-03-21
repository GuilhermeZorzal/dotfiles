-- Sample configuration is supplied
return {
  {
    "lmburns/lf.nvim",
    config = function()
      -- This feature will not work if the plugin is lazy-loaded
      vim.g.lf_netrw = 1

      require("lf").setup({
        escape_quit = false,
        border = "rounded",
      })

      vim.keymap.set("n", "<A-Space>", "<Cmd>Lf<CR>")
    end,
    requires = {"toggleterm.nvim"}
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>td", "<cmd>ToggleTerm size=40 dir=~/Desktop direction=horizontal<cr>", desc = "Open a horizontal terminal at the Desktop directory" }
      },
  }

}

