return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    "folke/lazydev.nvim",
  },
  config = function()
    require("lazydev").setup({
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    })

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local servers = { 'lua_ls', 'ols', 'zls', 'basedpyright', 'cssls', 'html', 'clangd' }

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my.lsp', {}),
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
          vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
          })
        end
      end,
    })
    vim.cmd("set completeopt+=noselect")

    vim.lsp.enable(servers)

    vim.lsp.config('*', {
      capabilities = capabilities
    })
  end
}
