return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false,                    -- neo-tree will lazily load itself,
  config = function()
    vim.keymap.set('n', '<leader>n', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
    vim.keymap.set('n', '<leader>.', '<cmd>Neotree reveal reveal_force_cwd<CR>', { desc = 'Reveal current buffer in Neotree' })

    -- Fire git event to refresh neo-tree git status
    local refresh_git = function()
      local events = require("neo-tree.events")
      events.fire_event(events.GIT_EVENT)
    end

    -- Refresh on various events that might indicate git changes
    vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
      callback = refresh_git,
    })

    -- Refresh after terminal closes (for git commands in terminal)
    vim.api.nvim_create_autocmd({ "TermClose" }, {
      callback = function()
        vim.defer_fn(refresh_git, 100) -- Small delay to ensure git operations complete
      end,
    })

    require("neo-tree").setup({
      reveal_force_cwd = true,
      window = {
        width = function()
          local width = math.floor(vim.o.columns * 0.25) -- 25% of screen
          return math.max(10, math.min(width, 60))       -- Between 30 and 50 columns
        end
      },
      default_component_configs = {
        git_status = {
          symbols = {
            untracked = "", --     󱔢  󰡯  󱀶
          }
        }
      },
      filesystem = {
        use_libuv_file_watcher = true, -- Auto-refresh on file system changes
        follow_current_file = {
          enabled = true,
        },
      },
      event_handlers = {
        {
          event = "git_event",
          handler = function()
            require("neo-tree.sources.manager").refresh("filesystem")
          end
        },
      },
    })
  end
}
