return {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
        local names = { "rose-pine", "rose-pine-main", "rose-pine-moon", "rose-pine-dawn" }
        vim.cmd.colorscheme(names[1])

        -- transparent
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        require("rose-pine").setup({

            enable = {
                terminal = true,
            },

            styles = {
                italic = true,
                bold = true,
                transparency = true,
            },

            highlight_groups = {
                TelescopeBackground = { bg = "none" },
                TelescopeBorder = { fg = "highlight_high", bg = "none" },
                TelescopeNormal = { bg = "none" },
                TelescopePromptNormal = { bg = "none" },
                TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                TelescopeSelection = { fg = "text", bg = "none" },
                TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
                CurSearch = { fg = "base", bg = "rose", inherit = false },
                Search = { bg = "rose", blend = 20, inherit = false },
            },
        })

    end
}

