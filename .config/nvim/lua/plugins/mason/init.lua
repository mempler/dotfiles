return {
    { "williamboman/mason.nvim", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                -- Lua for nvim
                "lua_ls",

                -- Rust
                "rust_analyzer",
                "taplo",

                -- Shell
                "bashls",
            },
        },
    },
}
