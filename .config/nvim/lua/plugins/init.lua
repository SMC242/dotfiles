-- Hybrid line numbers by default
vim.wo.number = true
vim.wo.relativenumber = true

Keymap = vim.keymap.set

-- Centre screen after page-up/down
Keymap("n", "<C-u>", "<C-u>zz")
Keymap("n", "<C-d>", "<C-d>zz")

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
  { import = "nvchad.blink.lazyspec" },
}
