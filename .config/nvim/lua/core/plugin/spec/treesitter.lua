return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = {
        "TSUpdate",
        "TSEnable",
        "TSToggle",
        "TSDisable",
        "TSInstall",
        "TSBufEnable",
        "TSBufToggle",
        "TSEditQuery",
        "TSUninstall",
        "TSBufDisable",
        "TSConfigInfo",
        "TSModuleInfo",
        "TSUpdateSync",
        "TSInstallInfo",
        "TSInstallSync",
        "TSInstallFromGrammar",
    },
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "bibtex",
            "c",
            "cpp",
            "go",
            "java",
            "json",
            "latex",
            "lua",
            "markdown",
            "rust",
            "toml",
            "typescript",
            "vimdoc",
            "zig",
        },

        -- NOTE:
        -- The highlight in command window broken.
        -- See: https://github.com/neovim/neovim/issues/26346
        highlight = {
            enable = true,
        },

        -- Enable this for fixing indentation at some language.
        -- reference: https://zenn.dev/uga_rosa/articles/9eb5063f8f9b75
        indent = {
            enable = true,
        },
    },
}
