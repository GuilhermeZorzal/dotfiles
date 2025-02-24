local lspconfig = require("lspconfig")
local lspcontainers = require("lspcontainers")

-- Configure Python LSP (pylsp)
lspconfig.pylsp.setup({
  -- Use the Dockerized LSP command
  cmd = lspcontainers.command("pylsp"),
  -- Ensure the LSP can find your project files
  root_dir = lspconfig.util.root_pattern(".git", "requirements.txt"),
  -- Other LSP settings (e.g., keymaps, capabilities)
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- require'lspconfig'.pylsp.setup {
--   cmd = require'lspcontainers'.command('pylsp'),
-- }
