return {
  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    config = function(_, opts)
      -- Open compiler
      vim.api.nvim_buf_set_keymap(0, 'n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

      -- Toggle compiler results
      vim.api.nvim_buf_set_keymap(0, 'n', '<S-F6>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

      require("compiler").setup(opts)
    end,
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "3047ede61cc1308069ad1184c0d447ebee92d749",
    cmd = { "CompilerOpen", "CompilerToggleResults" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
        bindings = { ["q"] = function() vim.cmd("OverseerClose") end },
      },
    },
  }
}
