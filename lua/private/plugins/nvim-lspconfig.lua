return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile"},
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            -- Mappings.
            local opts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
        end
        
        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- configure python server
        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure javascript server
        lspconfig["ts_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure go server
        lspconfig["gopls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure zig server
        lspconfig["zls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure c and c++ server
        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
            Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    })

    end
}
