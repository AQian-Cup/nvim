return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    config = true,
    keys = {
      { "<leader>ng", "<cmd>Neogit<CR>", desc = "Open Neogit" },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
    lazy = false,
    keys = {
      {
        "]c",
        function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() require("gitsigns").next_hunk() end)
          return "<Ignore>"
        end,
        desc = "Next hunk"
      },
      {
        "[c",
        function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() require("gitsigns").prev_hunk() end)
          return "<Ignore>"
        end,
        desc = "Previous hunk"
      },
      { "<leader>hs",  "<cmd>Gitsigns stage_hunk<CR>",      desc = "Stage hunk" },
      { "<leader>hr",  "<cmd>Gitsigns reset_hunk<CR>",      desc = "Reset hunk" },
      { "<leader>hsa", "<cmd>Gitsigns stage_buffer<CR>",    desc = "Stage buffer" },
      { "<leader>hu",  "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo stage hunk" },
      { "<leader>hra", "<cmd>Gitsigns reset_buffer<CR>",    desc = "Reset buffer" },
      { "<leader>hp",  "<cmd>Gitsigns preview_hunk<CR>",    desc = "Preview hunk" },
      {
        "<leader>hb",
        function()
          require("gitsigns").blame_line({ full = true })
        end,
        desc = "Blame line"
      },
      { "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle line blame" },
      { "<leader>hd", "<cmd>Gitsigns diffthis<CR>",                  desc = "Diff this" },
      {
        "<leader>hdh",
        function()
          require("gitsigns").diffthis("~")
        end,
        desc = "Diff this ~"
      },
      { "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Toggle deleted" },
    }
  }
}
