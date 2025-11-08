vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymap here

keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- window managment
keymap.set("n", "<leader>sv", "<C-w>v")     -- splits window vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- splits window horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width
keymap.set("n", "<leader>sq", ":close<CR>") -- close current split windows

-- tab managment
keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>tq", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- go to previous tab

-- buffers managment
keymap.set("n", "<leader>bn", ":bnext<CR>") -- go to next buffer
keymap.set("n", "<leader>bp", ":bprev<CR>") -- go to previous buffer

-- maximizer
keymap.set("n", "<leader>sm", ":Maximize<CR>")

-- LSP Feature Mappings (mostly current, no changes needed here based on deprecated.txt)
keymap.set('n', 'gD', vim.lsp.buf.declaration)
keymap.set('n', 'gd', vim.lsp.buf.definition)
keymap.set('n', 'K', vim.lsp.buf.hover)
keymap.set('n', 'gi', vim.lsp.buf.implementation)
keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
keymap.set('n', '<leader>D', vim.lsp.buf.type_definition)
keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
keymap.set('n', 'gr', function() Snacks.picker.lsp_references() end)

keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end)
keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end)
