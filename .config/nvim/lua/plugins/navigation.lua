return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
	{ "<leader><leader>", function() require('telescope.builtin').find_files() end, desc="Find: files" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      -- Enable telescope fzf if installed
      pcall(telescope.load_extension, 'fzf')

      -- Other extensions
      --
      --

      telescope.setup({})
    end
  }
}
