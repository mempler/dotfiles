vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"

vim.opt.pumheight = 12

vim.opt.mouse = "a"

vim.wo.relativenumber = true

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
})

require("config.keymaps")
require("config.lazy")
