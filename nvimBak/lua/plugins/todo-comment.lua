return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "LazyFile",
  opts = {
      search = {
        command = "rg",
        args = {
      "--glob=!node_modules/",  -- Exclude node_modules
      "--ignore-case",          -- Optional: make the search case insensitive
      "--fixed-strings",        -- Optional: treat the pattern as a literal string
      "--line-number",
      "--column",
      "--no-heading",
      "--color=never",
      "--json",
          -- "--color=never",
          -- "--no-heading",
          -- "--with-filename",
          -- "--line-number",
          -- "--column",
          -- "--glob '!node_modules/'",
        }

    },
  }
}
