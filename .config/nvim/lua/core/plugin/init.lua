-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "core.plugin.spec" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
