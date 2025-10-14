return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    lazy = true,
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        -- For luasnip users.
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        --For Dev Icons
        -- "nvim-tree/nvim-web-devicons",
        "onsails/lspkind.nvim"
    },

    config = function()
        local luasnip = require("luasnip")
        vim.keymap.set({ "i", "s" }, "<Tab>", function()
            if luasnip.in_snippet() then
                luasnip.jump(1)
            else
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
            if luasnip.in_snippet() then
                luasnip.jump(-1)
            end
        end, { silent = true })


        local cmp = require("cmp")
        require("luasnip.loaders.from_vscode").lazy_load()
        cmp.setup({
            window = {
                completion = {
                    border = "rounded",
                    winhighlight = "Normal:Pmenu,FloatBorder:CmpBorder,Search:None",
                    col_offset = -3,
                    side_padding = 0,
                },
                documentation = cmp.config.window.bordered({
                    border = 'rounded',
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                }),
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    local kind = require("lspkind").cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                    })(entry, vim_item)

                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = " " .. (strings[1] or "") .. " "

                    -- local menu_color
                    -- if entry.source.name == "luasnip" then
                    --     menu_color = "%#CmpItemMenuSnippet#"
                    -- else
                    --     menu_color = "%#CmpItemMenuDefault#"
                    -- end

                    -- kind.menu = menu_color .. "(" .. (strings[2] or "") .. ")"
                    kind.menu = "    (" .. (strings[2] or "") .. ")"

                    return kind
                end,
            },
            completion = {
                completeopt = "menu, menuone, preview, noselect",
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            }),
        })
    end
}
