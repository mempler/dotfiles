return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rouge8/neotest-rust",
    },
    keys = {
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Tests: Run",
      },
      {
        "<leader>tc",
        function()
          require("neotest").run.stop()
        end,
        desc = "Tests: cancel",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle()
        end,
        desc = "Tests: Watch",
      },
      {
        "<leader>to",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Tests: Output Panel",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust"),
        },

        diagnostic = {
          enabled = true,
        },
      })
    end,
  },
}
