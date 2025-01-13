return {
  "olrtg/nvim-emmet",
  config = function()
    vim.keymap.set(
      { "n", "v" },
      "<leader>sr",
      require("nvim-emmet").wrap_with_abbreviation,
      { desc = "Emmet Wrap with abbreviation" }
    )
  end,
  event = { "BufReadPre", "BufNewFile" },
}
