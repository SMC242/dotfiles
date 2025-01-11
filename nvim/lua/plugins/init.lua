-- Hybrid line numbers by default
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.clipboard = "unnamed"

Keymap = vim.keymap.set

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {},
  },
}
