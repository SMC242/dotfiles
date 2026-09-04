-- Adapted from https://stackoverflow.com/a/7615129
function words(str)
  local sep = " "
  local t = {}
  for substr in string.gmatch(str, "([^" .. sep .. "]+)") do
    table.insert(t, substr)
  end
  return t
end

-- Source: https://gist.github.com/kgriffs/124aae3ac80eefe57199451b823c24ec
function string:startswith(start)
  return self:sub(1, #start) == start
end

function realpath_under_cursor()
  -- Should be oil:///absolute/path/to/dir
  local oil_buf_name = vim.fn.getreg "%"
  if oil_buf_name == "" then
    return vim.api.nvim_echo({ { "ERROR: the file name register is empty" } }, true, { err = true })
  elseif not string.startswith(oil_buf_name, "oil://") then
    return vim.api.nvim_echo({ { "ERROR: not an Oil.nvim buffer" } }, true, { err = true })
  end

  -- Strip oil:// prefix. NOTE: Lua uses 1-based indexing
  local dir_name = oil_buf_name:sub(7)

  local current_line = vim.api.nvim_get_current_line()
  if current_line == "" then
    return vim.api.nvim_echo({ { "ERROR: nothing under the cursor" } }, true, { err = true })
  end

  -- Oil lines contain line number, an icon, and the file name
  local target_file_name = words(current_line)[3]
  vim.fn.setreg("*", dir_name .. target_file_name)
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
