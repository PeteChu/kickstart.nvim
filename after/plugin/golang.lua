local keymap = require('utils.utils').keymap

-- Gopher.nvim
keymap('n', '<leader>Gsj', '<cmd> GoTagAdd json <CR>', { desc = "Add [J]son struct tags" })
keymap('n', '<leader>Gsy', '<cmd> GoTagAdd yaml <CR>', { desc = "Add [Y]aml struct tags" })
