-- Adapted from https://stackoverflow.com/a/7615129
function words(str)
  local sep = " "
  local t = {}
  for substr in string.gmatch(str, "([^" .. sep .. "]+)") do
    table.insert(t, substr)
  end
  return t
end

function realpath_under_cursor()
  local line = vim.api.nvim_get_current_line()
  -- Oil lines include a line number, file icon, and file name
  local split = words(line)
  local file_name = split[3]

  local cmd = string.format("realpath %s", file_name)
  local handle = io.popen(cmd)
  if handle == nil then
    return vim.api.nvim_echo({ { "ERROR: failed to run shell command\n" } }, true, { err = true })
  end

  local output = handle:read "*a"
  if output == nil then
    vim.api.nvim_echo({ { "ERROR: no output from shell command" } }, true, { err = true })
  else
    vim.fn.setreg("*", output)
  end
end

return {
  "stevearc/oil.nvim",
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["gY"] = { realpath_under_cursor, mode = "n", desc = "Copy absolute path under cursor" },
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)
    vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { silent = true, desc = "Oil Open Oil" })
  end,
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
}
