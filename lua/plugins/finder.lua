return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim', },
    config = function()
      local actions = require("telescope.actions")
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ["<CR>"] = actions.select_tab,
            },
            n = {
              ["<CR>"] = actions.select_tab,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        },
        pickers = {
          find_files = {
            hidden = true
          },
        }
      })
      require('telescope').load_extension('fzf')
    end,
    keys = {
      { '<leader>ff', "<cmd>Telescope find_files<cr>", desc = 'Find Files' },
      { '<leader>fg', "<cmd>Telescope live_grep<cr>",  desc = 'Find Words' },
      { '<leader>fb', "<cmd>Telescope buffers<cr>",    desc = 'Find Buffers' },
      { '<leader>fh', "<cmd>Telescope help_tags<cr>",  desc = 'Find Help' },
    }
  },
}
