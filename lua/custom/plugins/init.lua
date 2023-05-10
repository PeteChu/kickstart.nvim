-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  'fatih/vim-go',
  'famiu/bufdelete.nvim',
  'ThePrimeagen/harpoon',
  'ThePrimeagen/vim-be-good',
  'stevearc/dressing.nvim',
  "onsails/lspkind.nvim",
  'lukas-reineke/cmp-rg',
  'onsails/diaglist.nvim',
  'Bekaboo/deadcolumn.nvim',
  'f-person/git-blame.nvim',
  'kevinhwang91/nvim-bqf',
  config = function()
    require('diaglist').init()
  end
}
