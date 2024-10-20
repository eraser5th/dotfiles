return {
    "williamboman/mason.nvim",
    opts = {
        ui = {
            border = "rounded",
            height = 0.8,
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("set-mason-winblend", {}),
            pattern = "mason",
            callback = function()
                vim.opt.winblend = 10
            end,
        })
    end,
}
