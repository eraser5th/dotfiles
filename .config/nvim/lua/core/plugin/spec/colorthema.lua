return {
    --[[
    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").load()
        end,
    },
    --]]
    {
        "0xstepit/flow.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        init = function()
            vim.cmd("colorscheme flow")
        end,
    },
}
