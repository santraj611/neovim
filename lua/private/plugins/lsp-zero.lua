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

    -- setting some global variables for lsp-zero
    vim.g.lsp_zero_ui_float_border = 'rounded'
    vim.g.lsp_zero_ui_signcolumn = 1
    vim.g.lsp_zero_api_warnings = 1
    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })

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
