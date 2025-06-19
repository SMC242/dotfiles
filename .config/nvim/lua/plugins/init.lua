-- Hybrid line numbers by default
vim.wo.number = true
vim.wo.relativenumber = true

Keymap = vim.keymap.set

require "filetypes.ansible"

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
