return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {
            's1n7ax/nvim-window-picker',
            version = '2.*',
            config = function()
                require 'window-picker'.setup({
                    hint = 'floating-big-letter',
                    filter_rules = {
                        include_current_win = false,
                        autoselect_one = true,
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of following, the window will be ignored
                            filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                            -- if the buffer type is one of following, the window will be ignored
                            buftype = { 'terminal', "quickfix" },
                        },
                    },
                })
            end,
        }
    },
    config = function()
        local ntree = require 'neo-tree'

        vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

        ntree.setup({
            close_if_last_window = true,
            window = {
                enable_git_status = true,
                mappings = {
                    ["o"] = "open",
                    ['<S-l>'] = "open",
                    ["F"] = "clear_filter",
                    ["S"] = "split_with_window_picker",
                    ["s"] = "vsplit_with_window_picker",
                    -- ['e'] = function() vim.api.nvim_command('Neotree focus filesystem left') end,
                    -- ['b'] = function() vim.api.nvim_command('Neotree focus buffers left') end,
                    -- ['g'] = function() vim.api.nvim_command('Neotree focus git_status left') end,
                }
            },
            filesystem = {
                follow_current_file = {
                    enabled = true
                },
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
