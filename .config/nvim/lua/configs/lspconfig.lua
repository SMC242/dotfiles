-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "pyright",
  "bashls",
  "ts_ls",
  "eslint",
  "yamlls",
  "jsonls",
  "gopls",
  "clangd",
  "emmet_language_server",
  "tailwindcss",
  "astro",
  "bicep",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  if lsp == "bicep" then
    -- Mason installs a script that runs dotnet, so ignoring the lspconfig docs
    -- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bicep
    local bicep_lsp_path = "/home/eilidhm/.local/share/nvim/mason/packages/bicep-lsp/bicep-lsp"
    lspconfig["bicep"].setup {
      cmd = { bicep_lsp_path },
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    }
  end
end
