return {
    "santraj611/custom-onedark",
    lazy = false, -- Load on startup OR load when :colorscheme is called
    priority = 1000, -- Make sure it loads before other plugins that depend on colors
    config = function ()
        vim.cmd("colorscheme custom-onedark")
    end
}
