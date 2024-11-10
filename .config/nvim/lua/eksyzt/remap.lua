my_functions = require("eksyzt.my_functions")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "<F5>", '"+y')


vim.keymap.set('n', '<leader>nt', my_functions.open_nvim_in_current_explorer_dir, { noremap = true, silent = true })

