return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "3rd/image.nvim",
    },
    branch = "0.1.x",
    cmd = "Telescope",
    opts = {
        defaults = {
            winblend = 10,
        },
    },
    init = function()
        vim.keymap.set("n", "ff", "<CMD>Telescope find_files<CR>")
        vim.keymap.set("n", "fg", "<CMD>Telescope live_grep<CR>")

        vim.keymap.set("n", "fr", "<CMD>Telescope resume<CR>>")
    end,
}
