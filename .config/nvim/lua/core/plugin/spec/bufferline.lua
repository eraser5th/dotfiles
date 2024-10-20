return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
        options = {
            mode = "tabs",
            offsets = {
                {
                    filetype = "NeoTree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true,
                },
            },
        },
    },
}
