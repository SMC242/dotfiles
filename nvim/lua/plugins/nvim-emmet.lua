return {
  "olrtg/nvim-emmet",
  config = function()
    vim.keymap.set(
      { "n", "v" },
      "<leader>wr",
      require("nvim-emmet").wrap_with_abbreviation,
      { desc = "Emmet Wrap with abbreviation" }
    )
  end,
  event = { "BufReadPre", "BufNewFile" },
}
