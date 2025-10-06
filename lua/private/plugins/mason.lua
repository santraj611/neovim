return {
    "williamboman/mason.nvim",
    dependencies = {
    "williamboman/mason-lspconfig.nvim",
    },
    cmd = "Mason",
    build = ":MasonUpdate",
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
            ensure_installed = {'lua_ls', 'zls', 'ty'},
            automatic_installation = true,
        })
    end
}

