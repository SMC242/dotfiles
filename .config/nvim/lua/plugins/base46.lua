return {
  "nvchad/base46",
  lazy = true,
  version = "v3.0",
  build = function()
    require("base46").load_all_highlights()
  end,
}
