return {
    "williamboman/mason.nvim",
    dependencies = {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require('mason').setup({

            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }

        })
        require('mason-lspconfig').setup({
            ensure_installed = {'lua_ls', 'rust_analyzer', 'pyright', 'clangd'},
            automatic_installation = true,
        })
    end
    },
    opts = {
        ensure_installed = { 'rust_analyzer' }
    },
}

