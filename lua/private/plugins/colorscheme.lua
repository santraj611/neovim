return {{
    'redshifttt/nebula.vim',
    lazy = false,
    priority = 1000,
    -- config = function ()
        -- vim.g.spacegray_use_italics = 1;
        -- vim.g.spacegray_low_contrast = 1;
        -- vim.cmd.colorscheme('spacegray');
        -- end
    },

    {
        'sainnhe/sonokai',
        lazy = false,
        priority = 1000,
        -- config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            -- vim.g.sonokai_enable_italic = true
            -- vim.g.sonokai_style = 'espresso'
            -- vim.cmd.colorscheme('sonokai')
            -- end
        },
        {
            "zenbones-theme/zenbones.nvim",
            -- Optionally install Lush. Allows for more configuration or extending the colorscheme
            -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
            -- In Vim, compat mode is turned on as Lush only works in Neovim.
            dependencies = "rktjmp/lush.nvim",
            lazy = false,
            priority = 1000,
            -- you can set set configuration options here
            -- config = function()
                --     vim.g.zenbones_darken_comments = 45
                --     vim.cmd.colorscheme('zenbones')
                -- end
            },
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
        },
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            opts = {},
        },
        }
