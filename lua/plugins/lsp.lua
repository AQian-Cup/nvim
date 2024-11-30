return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    keys = {
      {
        '<leader>ih',
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end,
        desc = "Toggle inlay hint"
      }
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "volar", "lua_ls", "ts_ls", "unocss", "rust_analyzer" },
        automatic_installation = true,
      })
      local lspconfig = require("lspconfig")
      lspconfig.volar.setup {
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      }
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = {
                'vim',
              },
            },
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              }
            },
            telemetry = {
              enable = false,
            },
            hint = { enable = true, setType = true },
          },
        },
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = vim.api.nvim_create_augroup("LuaFormatting", { clear = true }),
              buffer = bufnr,
              callback = function()
                if vim.bo.filetype == "lua" then
                  vim.lsp.buf.format()
                end
              end
            })
          end
        end,
      })
      lspconfig.biome.setup({})
      lspconfig.unocss.setup({})
    end,
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
  }
}
