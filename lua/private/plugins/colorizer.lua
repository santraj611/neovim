return {'norcalli/nvim-colorizer.lua',
        -- Color code highlighter 
    lazy = false,
    config = function()
        local colorizer = require("colorizer")
        colorizer.setup()
    end
}
