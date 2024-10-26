return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        position = "current",
        mappings = {
          ["<cr>"] = "open_tabnew",
        }
      },
      close_if_last_window = false,
      enable_git_status = true,
      enable_diagnostics = true,
      use_libuv_file_watcher = true,
    },
    keys = {
      { "<leader>nt", "<cmd>Neotree reveal<cr>", desc = "Toggle Explorer" },
    }
  }
}
