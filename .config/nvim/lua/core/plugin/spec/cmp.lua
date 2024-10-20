return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            -- Snippet engine
            "L3MON4D3/LuaSnip",

            -- Sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "saadparwaiz1/cmp_luasnip",

            -- Visual
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- Settings for insert mode.
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = {
                        winblend = 10,
                    },
                    documentation = {
                        winblend = 10,
                        border = "rounded",
                    },
                },
                ---@diagnostic disable-next-line
                formatting = {
                    format = require("lspkind").cmp_format({
                        mode = "symbol_text",
                        -- List all possible source name
                        menu = {
                            buffer = "[Buffer]",
                            cmdline = "[Cmd]",
                            lazydev = "[LazyDev]",
                            luasnip = "[LuaSnip]",
                            neorg = "[Neorg]",
                            nvim_lsp = "[LSP]",
                            nvim_lsp_signature_help = "[Signature]",
                            path = "[Path]",
                        },
                    }),
                },
                mapping = {
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<C-n>"] = cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Select,
                    }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({
                        behavior = cmp.SelectBehavior.Select,
                    }),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "lazydev" },
                    { name = "neorg" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
            })

            -- Command line settings (when "/" or "?")
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Command line settings (when ":")
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    },
}
