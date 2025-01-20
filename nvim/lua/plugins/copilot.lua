return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
    { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  },
  build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    mapping = {
      submit_prompt = {
        normal = '<CR>',
        insert = '<M-s>',
      },
    },
  },
  config = function()
    require('CopilotChat').setup({
      mapping = {
        submit_prompt = {
          normal = '<CR>',
          insert = '<M-s>',
        },
      },
    })
  end,

}
