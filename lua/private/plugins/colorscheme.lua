return {
  "deparr/tairiki.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tairiki").load()
  end
}
