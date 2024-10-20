return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
        {
            "<C-\\>",
            mode = "n",
        },
    },
    cmd = {
        "ToggleTerm",
        "ToggleTermToggleAll",
        "TermExec",
        "TermSelect",
        "ToggleTermSetName",
        "ToggleTermSendCurrentLine",
        "ToggleTermSendVisualLines",
        "ToggleTermSendVisualSelection",
    },
    config = function()
        require("toggleterm").setup()

        local terminal = require("toggleterm.terminal").Terminal
        local floatterm = terminal:new({
            direction = "float",
            float_opts = {
                border = "rounded",
            },
        })
        vim.keymap.set("n", "<C-\\>", function()
            floatterm:toggle()
        end, {
            desc = "toggle floating terminal",
        })
    end,
}
