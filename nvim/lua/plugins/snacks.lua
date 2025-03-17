return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- for hidden files
        ignored = true, -- for .gitignore files
        sources = {
          files = {
            hidden = true,
          },
        },
      },
    },
    keys = {
      {
        "<leader>sf",
        function()
          Snacks.picker.files()
        end,
        desc = "Find File",
      },
      {
        "<leader>sb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Find Buffer",
      },
    },
  },
}
