return {
  "rolv-apneseth/tfm.nvim",
  opts = {
    -- TFM to use
    -- Possible choices: "ranger" | "nnn" | "lf" | "vifm" | "yazi" (default)
    file_manager = "yazi",
  },
  keys = {
    -- Make sure to change these keybindings to your preference,
    -- and remove the ones you won't use
    {
      "<A-Space>",
      function()
        require("tfm").open()
      end,
      desc = "TFM",
    },
    ":Tfm<CR>",
    desc = "TFM",
  },
}
