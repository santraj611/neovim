return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
  },
  event = "BufReadPre",
  config = function()
    local lsp = require('lsp-zero')
    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })

    vim.lsp.util.open_floating_preview = (function(orig)
      return function(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return orig(contents, syntax, opts, ...)
      end
    end)(vim.lsp.util.open_floating_preview)

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
      lsp.buffer_autoformat()
    end)

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          runtime = {
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = { vim.env.VIMRUNTIME },
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    lsp.setup()
  end
}
