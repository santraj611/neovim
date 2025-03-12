return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
        no_italic = true,
        term_colors = true,
        transparent_background = false,

    config = function ()
        local catppuccin = require("catppuccin");
        catppuccin.setup({
            styles = {
                comments = { "italic" }, -- Change the style of comments
                conditionals = {},
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
            },
            color_overrides = {
                mocha = {
                    base = "#000000",
                    mantle = "#000000",
                    crust = "#000000",
                },
            },
            integrations = {
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
                dropbar = {
                    enabled = true,
                    color_mode = true,
                },
            },

        })

        catppuccin.load();
    end,
}
