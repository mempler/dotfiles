return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = {
            "VeryLazy",

            -- On opening file
            "BufReadPost",
            "BufWritePost",
            "BufNewFile",
        },
        lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "rust",
                    "toml",
                    "bash",
                    "regex",
                    "latex",
                    "html",
                },
                auto_install = true,
                sync_install = false,
                modules = {},
                ignore_install = {},
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        opts = {},
    },
    {
        "fladson/vim-kitty",
        lazy = false,
        ft = "kitty",
    },
}
