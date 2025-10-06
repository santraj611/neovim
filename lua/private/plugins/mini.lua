return {
    'nvim-mini/mini.nvim', version = '*',
    lazy = false,
    config = function ()
        require('mini.surround').setup()
        require('mini.tabline').setup()
        require('mini.statusline').setup()
        require('mini.comment').setup()
        require('mini.pairs').setup()
        require('mini.icons').setup()
    end
}
