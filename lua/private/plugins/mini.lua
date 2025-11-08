return {
  'nvim-mini/mini.nvim',
  lazy = false,
  config = function()
    require('mini.comment').setup()
    require('mini.icons').setup()
    require('mini.move').setup()
    require('mini.pairs').setup()
    require('mini.tabline').setup()
    require('mini.surround').setup()
    require('mini.statusline').setup()
  end
}
