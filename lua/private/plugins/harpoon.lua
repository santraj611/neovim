return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
        local harpoon = require("harpoon")
        local set = vim.keymap.set;

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        set("n", "<leader>a", function() harpoon:list():add() end)
        set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        set("n", "<C-h>", function() harpoon:list():select(1) end)
        set("n", "<C-t>", function() harpoon:list():select(2) end)
        set("n", "<C-n>", function() harpoon:list():select(3) end)
        set("n", "<C-s>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        set("n", "<C-S-P>", function() harpoon:list():prev() end)
        set("n", "<C-S-N>", function() harpoon:list():next() end)
    end
}
