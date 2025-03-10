return {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup({
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "vue",
          "svelte",
          "php",
          "markdown",
        },
      })
  end,
}
