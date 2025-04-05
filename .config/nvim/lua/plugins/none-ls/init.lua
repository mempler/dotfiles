return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        },
        opts = function()
            local null_ls = require("null-ls")

            local formatting = null_ls.builtins.formatting
            -- local completion = null_ls.builtins.completion
            -- local code_actions = null_ls.builtins.code_actions
            -- local diagnostics = null_ls.builtins.diagnostics

            return {
                sources = {
                    formatting.stylua,
                },
            }
        end,
    },
}
