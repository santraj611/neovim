return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},

  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
  },
  {
    'deparr/tairiki.nvim',
    lazy = false,
    priority = 1000, -- recommended if you use tairiki as your default theme
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
  },
  {
    "vague-theme/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({
      })
    end
  },
}
