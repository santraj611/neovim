-- plugins installation
vim.pack.add({
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/akinsho/bufferline.nvim',
    'https://github.com/norcalli/nvim-colorizer.lua',
    'https://github.com/santraj611/custom-onedark',
    'https://github.com/numToStr/Comment.nvim',
    'https://github.com/j-hui/fidget.nvim',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/declancm/maximize.nvim',
    'https://github.com/tiagovla/scope.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/kylechui/nvim-surround',
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    -- 'https://github.com/williamboman/mason-lspconfig.nvim',
    { src = 'https://github.com/nvim-telescope/telescope.nvim', branch = '0.1.x' },
})

-- plugins configs

-- auotpairs
require('nvim-autopairs').setup()

-- colorize
require("colorizer").setup()

-- colorscheme
local cod = require('onedark')
cod.setup({
    italic_comments = true, -- or false -- Default is true
});
vim.cmd("colorscheme onedark")

-- comments
require('Comment').setup()

-- fidget
require("fidget").setup()

-- maximize
require("maximize").setup()

-- scope
require('scope').setup({})

-- nvim-surround
require("nvim-surround").setup()

-- mason
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
-- require('mason-lspconfig').setup({
--     ensure_installed = {'lua_ls', 'zls', 'pyright'},
--     automatic_installation = true,
-- })

-- bufferline
local bufferline = require('bufferline')
bufferline.setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = "ordinal",
        close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon',
            -- style = 'icon' | 'underline' | 'none',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = false,
        -- diagnostics = false | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number, buf_numbers)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
            -- filter out by it's index number in list (don't show first buffer)
            if buf_numbers[1] ~= buf_number then
                return true
            end
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                -- text = "File Explorer" | function ,
                text_align = "center",
                -- text_align = "left" | "center" | "right"
                separator = true
            }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        get_element_icon = function(element)
            -- element consists of {filetype: string, path: string, extension: string, directory: string}
            -- This can be used to change how bufferline fetches the icon
            -- for an element e.g. a buffer or a tab.
            -- e.g.
            local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
            return icon, hl
        end,
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin",
        -- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        sort_by = 'insert_after_current',
        -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
            -- add custom logic
        }
    }

-- lualine
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

require('lualine').setup {
    options = {
        theme = 'onedark',
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

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- tree-sitter
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "bash", "python", "lua", "zig" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
