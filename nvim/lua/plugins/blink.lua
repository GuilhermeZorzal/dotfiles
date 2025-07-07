return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      -- set to 'none' to disable the 'default' preset
      ["<A-k>"] = { "select_prev", "fallback" },
      ["<A-j>"] = { "select_next", "fallback" },
      ["<A-y>"] = { "accept", "fallback" },

      -- show with a list of providers
      ["<C-space>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },
    },
  },
}
