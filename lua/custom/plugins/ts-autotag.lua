return {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup {}

    require('nvim-treesitter.configs').autotag = {
      enable = true
    }
  end
}
