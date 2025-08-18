return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      -- set to 'none' to disable the 'default' preset
      ["<S-k>"] = { "select_prev", "fallback" },
      ["<S-j>"] = { "select_next", "fallback" },
      ["<S-y>"] = { "accept", "fallback" },
      ["<S-CR>"] = { "accept", "fallback" },

      -- show with a list of providers
      ["<C-space>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },
    },
  },
}
