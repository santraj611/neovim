return {
    'norcalli/nvim-colorizer.lua',
    -- Color code highlighter
    lazy = true,
    config = function()
        local colorizer = require("colorizer")
        colorizer.setup()
    end
}
