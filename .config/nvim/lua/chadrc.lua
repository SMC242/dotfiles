-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
  --
}

M.mason = {
  pkgs = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "prettier",
    "prettierd",
    "pyright",
    "ruff",
    "bash-language-server",
    "typescript-language-server",
    "eslint-lsp",
    "yamllint",
    "yaml-language-server",
    "json-lsp",
    "rust-analyzer",
    "codelldb",
    "emmet-language-server",
    "gopls",
    "goimports",
    "clangd",
    "clang-format",
    "ormolu",
    "shellcheck",
    "tailwindcss-language-server",
    "ansible-language-server",
    "ansible-lint",
    "astro-language-server",
    "bicep-lsp",
    "erlang-ls",
  },
}

return M
