return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("h", "ﯠ  > Harpoon", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
      dashboard.button("m", "  > Mason", ":Mason<CR>"),
      dashboard.button("l", "鈴 > Lazy", ":Lazy<CR>"),
      dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
  end
}
