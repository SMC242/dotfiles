local pickers = require "telescope.builtin"

local sorted_diagnostics = function()
  pickers.diagnostics { sort_by = "severity" }
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  tag = "0.1.8",
  keys = {
    {
      "<leader>fd",
      sorted_diagnostics,
      mode = "n",
      noremap = true,
      silent = true,
      buffer = 0,
      desc = "Telescope Diagnostic viewer",
    },
  },
}
