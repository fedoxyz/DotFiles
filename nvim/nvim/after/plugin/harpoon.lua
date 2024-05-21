local harpoon = require('harpoon')
harpoon:setup()


vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-x>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-q>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-w>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-e>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-r>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<S-Q>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<S-E>", function() harpoon:list():next() end)
