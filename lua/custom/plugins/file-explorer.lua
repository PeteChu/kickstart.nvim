return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
        local ntree = require 'neo-tree'
        ntree.setup({
            close_if_last_window = true,
            window = {
                width = 40,
                mappings = {
                    ["o"] = "open",
                    ['<S-l>'] = "open",
                    ["F"] = "clear_filter",
                    ['e'] = function() vim.api.nvim_command('Neotree focus filesystem left') end,
                    ['b'] = function() vim.api.nvim_command('Neotree focus buffers left') end,
                    ['g'] = function() vim.api.nvim_command('Neotree focus git_status left') end,
                }
            },
            filesystem = {
                follow_current_file = true,
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                        ".git",
                        ".DS_Store",
                        "thumbs.db",
                        "node_modules",
                    }
                }
            },
            source_selector = {
                winbar = true
            }
        })
    end
}
