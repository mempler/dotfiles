return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "nvimtools/none-ls.nvim",
        },
        event = {
            "VeryLazy",

            -- On opening file
            "BufReadPost",
            "BufWritePost",
            "BufNewFile",
        },
        lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdlinei
        config = function()
            local lspconfig = require("lspconfig")

            -- Format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function(_)
                    vim.lsp.buf.format({ async = false })
                end,
            })

            -- Language Servers
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            require("mason-lspconfig").setup_handlers({
                -- Automatically setup for most common LSPs
                function(server)
                    lspconfig[server].setup({
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using
                                    -- (most likely LuaJIT in the case of Neovim)
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    -- Get the language server to recognize the `vim` global
                                    globals = {
                                        "vim",
                                        "require",
                                    },
                                },
                                workspace = {
                                    -- Make the server aware of Neovim runtime files
                                    library = vim.api.nvim_get_runtime_file("", true),
                                },
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    })
                end,
            })
        end,
    },
}
