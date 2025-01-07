return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            winbar = {},
            inactive_winbar = {},
        }
        -- Bubbles config for lualine
        -- Author: lokesh-krishna
        -- MIT license, see LICENSE for more details.

        -- stylua: ignore
        local colors = {
            blue   = '#80a0ff',
            cyan   = '#79dac8',
            black  = '#080808',
            white  = '#c6c6c6',
            red    = '#ff5189',
            violet = '#d183e8',
            grey   = '#303030',
            text = '#ffffff',
            lightsalmon = '#FFA07A',
            lightyellow = '#FFC300',
            lightgreen = '#9FE2BF',
            lightergrey = '#424949',
            lightblue = '#34495e',
        }

        local bubbles_theme = {
            normal = {
                -- right side
                a = { fg = colors.black, bg = colors.lightsalmon },
                b = { fg = colors.text, bg = colors.lightblue},
                c = { fg = colors.text, bg = colors.lightergrey },
                -- left side
                x = { fg = colors.text, bg = colors.lightergrey },
                y = { fg = colors.text, bg = colors.lightblue },
                z = { fg = colors.black, bg = colors.lightgreen},
            },

            insert = { a = { fg = colors.black, bg = colors.violet } },
            visual = { a = { fg = colors.black, bg = colors.lightyellow} },
            replace = { a = { fg = colors.black, bg = colors.red } },

            inactive = {
                a = { fg = colors.white, bg = colors.black },
                b = { fg = colors.white, bg = colors.black },
                c = { fg = colors.white },
                z = { fg = colors.black, bg = colors.lightgreen},
            },
        }

        require('lualine').setup {
            options = {
                theme = bubbles_theme,
                component_separators = '',
                section_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                lualine_b = { 'filename' },
                lualine_c = { 'branch' },
                lualine_d = {
                    '%=', --[[ add your center compoentnts here in place of this comment ]]
                },
                lualine_x = {'filetype'},
                lualine_y = {'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {},
        }
    end
}
