return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Or "VeryLazy" / specific FileType events
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        -- Consider "williamboman/mason.nvim" and "williamboman/mason-lspconfig.nvim"
        -- for easy LSP server management if you're not using them already.
    },
    config = function()
        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local telescope_builtin = require('telescope.builtin')
        vim.api.nvim_set_hl(0, "LspFloatBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "LspFloatNormal", { link = "NormalFloat" })

        -- This on_attach function will be called for each LSP that attaches to a buffer
        local on_attach = function(client, bufnr)
            -- Helper function to set keymaps locally for the current buffer
            local function map(mode, lhs, rhs, desc)
                local opts = { buffer = bufnr, noremap = true, silent = true }
                if desc then
                    opts.desc = desc -- For plugins like which-key.nvim
                end
                vim.keymap.set(mode, lhs, rhs, opts)
            end

            -- LSP Feature Mappings (mostly current, no changes needed here based on deprecated.txt)
            map('n', 'gD', vim.lsp.buf.declaration, 'LSP: Go to Declaration')
            map('n', 'gd', vim.lsp.buf.definition, 'LSP: Go to Definition')
            map('n', 'K', vim.lsp.buf.hover, 'LSP: Hover Documentation')
            map('n', 'gi', vim.lsp.buf.implementation, 'LSP: Go to Implementation')
            map('n', '<C-k>', vim.lsp.buf.signature_help, 'LSP: Signature Help')
            map('n', '<space>D', vim.lsp.buf.type_definition, 'LSP: Go to Type Definition')
            map('n', '<space>rn', vim.lsp.buf.rename, 'LSP: Rename Symbol')
            map('n', '<space>ca', vim.lsp.buf.code_action, 'LSP: Code Actions')

            -- Use Telescope for references (preferred)
            map('n', 'gr', telescope_builtin.lsp_references, 'LSP: Go to References (Telescope)')

            -- Workspace Folder Mappings
            map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, 'LSP: Add Workspace Folder')
            map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, 'LSP: Remove Workspace Folder')
            map('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, 'LSP: List Workspace Folders')

            -- Show diagnostics for the current line
            map('n', '<space>e', function()
                vim.diagnostic.open_float(0, { scope = "line", focus = false })
            end, 'Diagnostics: Show Line Diagnostics')

            -- Add buffer diagnostics to the location list
            map('n', '<space>q', function()
                vim.diagnostic.setloclist({ bufnr = 0, open = true })
            end, 'Diagnostics: Add Buffer Diagnostics to Loclist')

            map('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, 'Diagnostics: Go to Previous')
            map('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, 'Diagnostics: Go to Next')

        end

        -- Setup capabilities with cmp-nvim-lsp
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

        -- Configure diagnostic appearance (UPDATED based on deprecated.txt)
        local signs_icons = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        vim.diagnostic.config({
            signs = {
                active = true, -- This is true by default
                text = {
                    [vim.diagnostic.severity.ERROR] = signs_icons.Error,
                    [vim.diagnostic.severity.WARN]  = signs_icons.Warn,
                    [vim.diagnostic.severity.INFO]  = signs_icons.Info,
                    [vim.diagnostic.severity.HINT]  = signs_icons.Hint,
                },
            },
            virtual_text = false, -- Enable/configure if you like virtual text for diagnostics
            -- virtual_text = { prefix = '●', spacing = 4 },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            -- float = { -- Default options for diagnostic floating windows
            --     focusable = false,
            --     style = "minimal",
            --     border = "rounded",
            --     source = "always", -- Or "if_many"
            --     header = "",
            --     prefix = "",
            -- },
        })

        -- Configure LSP servers
        -- List of servers to set up with the common on_attach and capabilities
        local servers_to_configure = { "pyright", "zls" }
        for _, server_name in ipairs(servers_to_configure) do
            lspconfig[server_name].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end

        -- Special configuration for lua_ls (Lua Language Server)
        lspconfig["lua_ls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT', -- Neovim uses LuaJIT
                    },
                    diagnostics = {
                        globals = { "vim" }, -- Recognize "vim" global
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                        checkThirdParty = false, -- Can improve performance
                    },
                    telemetry = {
                        enable = false, -- Disable telemetry
                    },
                },
            },
        })

    end
}
