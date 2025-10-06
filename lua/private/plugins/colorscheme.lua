return {
    -- dir = "~/codes/luaforbg/custom-onedark/",
    "santraj611/custom-onedark",
    lazy = false,
    priority = 1000,
    config = function ()
        local cod = require('onedark')
        cod.setup({
            italic_comments = true, -- or false -- Default is true
            bg_color = '#212629',
        });
        vim.cmd("colorscheme onedark")
    end
}
