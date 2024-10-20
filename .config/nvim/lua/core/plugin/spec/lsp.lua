return {
    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({})
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons", -- optional
        },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        dependencies = {
            "Bilal2453/luvit-meta",
        },
        opts = {
            library = {
                "luvit-meta/library",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "stevearc/conform.nvim",
        },
        config = function()
            -- Keymaps for lsp actions
            -- reference: https://zenn.dev/botamotch/articles/21073d78bc68bf
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("register-lsp-keymaps", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gf", function()
                        require("conform").format({ async = true })
                    end, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "ge", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "g]", function()
                        vim.diagnostic.jump({ count = 1 })
                    end, opts)
                    vim.keymap.set("n", "g[", function()
                        vim.diagnostic.jump({ count = -1 })
                    end, opts)
                end,
            })

            -- Specify lsps to install
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "lua_ls",
                    "rust_analyzer",
                    "pylsp",
                    "tsserver",
                },
            })

            -- Default config of each lsp.
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            -- mason-lspconfig doesn't manage gdscript, so manually configure the lsp.
            lspconfig.gdscript.setup({
                capabilities = capabilities,
            })

            require("mason-lspconfig").setup_handlers({
                function(name)
                    lspconfig[name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                workspace = {
                                    checkThirdParty = false,
                                },
                                runtime = {
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,
                ["rust_analyzer"] = function()
                    lspconfig.rust_analyzer.setup({
                        capabilities = capabilities,
                        settings = {
                            ["rust-analyzer"] = {
                                check = {
                                    command = "clippy",
                                },
                            },
                        },
                    })
                end,
            })
        end,
    },
}
