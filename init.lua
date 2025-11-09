require("private.core.options")
require("private.core.keymaps")

-- bootstraping lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- setting up defualt colorscheme
---@param fallback? string
_G.get_colorscheme = function(fallback)
  if not vim.g.COLORS_NAME then
    vim.cmd.rshada()
  end
  if not vim.g.COLORS_NAME or vim.g.COLORS_NAME == '' then
    return fallback or 'default'
  end
  return vim.g.COLORS_NAME
end

---@param colorscheme? string
_G.save_colorscheme = function(colorscheme)
  colorscheme = colorscheme or vim.g.colors_name
  if get_colorscheme() == colorscheme then
    return
  end
  vim.g.COLORS_NAME = colorscheme
  vim.cmd.wshada()
end

require("lazy").setup({
  spec = {
    { import = 'private.plugins' },
  },
  install = {
    -- Set the colorscheme for the `:Lazy` UI
    colorscheme = { get_colorscheme 'default' },
  },
})
