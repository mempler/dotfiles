return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false, -- This plugin is already lazy
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup({
        autoload = true,
        lsp = {
          enabled = true,
          on_attach = function(client, bufnr)
            -- the same on_attach function as for your other language servers
            -- can be ommited if you're using the `LspAttach` autocmd
          end,
          actions = true,
          completion = true,
          hover = true,
        },
      })
    end,
  },
}
