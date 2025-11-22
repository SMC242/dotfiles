-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

require("nvchad.configs.lspconfig").defaults()

local bicep_lsp_path = "/home/eilidhm/.local/share/nvim/mason/packages/bicep-lsp/bicep-lsp"

local servers = {
  html = {},
  cssls = {},
  pyright = {},
  bashls = {},
  ts_ls = {},
  eslint = {},
  yamlls = {},
  jsonls = {},
  gopls = {},
  clangd = {},
  emmet_language_server = {},
  tailwindcss = {},
  astro = {},
  bicep = {
    -- Mason installs a script that runs dotnet, so ignoring the lspconfig docs
    -- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bicep
    cmd = { bicep_lsp_path },
  },
  erlangls = {},
}

-- lsps with default config
for lsp, config in pairs(servers) do
  config["on_attach"] = on_attach
  config["on_init"] = on_init
  config["capabilities"] = capabilities

  vim.lsp.config[lsp] = config
end

local lsp_names = {}
for lsp, _ in pairs(servers) do
  table.insert(lsp_names, lsp)
end

vim.lsp.enable(lsp_names)
