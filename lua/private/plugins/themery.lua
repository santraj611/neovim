return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        -- add the config here
        -- Your list of installed colorschemes.
        themes = {
            {
                name = "spacegray",
                colorscheme = "spacegray",
                before = [[
                vim.g.spacegray_use_italics = 1;
                ]],
            },
        {
            name = "sonokai espresso",
            colorscheme = "sonokai",
            before = [[
            vim.g.sonokai_enable_italic = true;
            vim.g.sonokai_style = 'espresso'
            ]],
        },
        {
            name = "zenbones",
            colorscheme = "zenbones",
        },
        {
            name = "catppuccin",
            colorscheme = "catppuccin",
        },
        {
            name = "tokyonight",
            colorscheme = "tokyonight",
        }
    },
      livePreview = true, -- Apply theme while picking. Default to true.
      })
    end
}
