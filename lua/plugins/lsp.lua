return {
  -- Mason: LSPサーバーのインストール管理
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 100,
    opts = {},
  },

  -- LSP設定
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- Lua
      vim.lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = {
          ".luarc.json",
          ".luarc.jsonc",
          ".luacheckrc",
          ".stylua.toml",
          ".git",
        },
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = { vim.env.VIMRUNTIME } },
          },
        },
      }
      vim.lsp.enable("lua_ls")

      -- Rust
      vim.lsp.config.rust_analyzer = {
        capabilities = capabilities,
      }
      vim.lsp.enable("rust_analyzer")

      -- TypeScript / React
      vim.lsp.config.ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        root_markers = {
          "tsconfig.json",
          "jsconfig.json",
          "package.json",
          ".git",
        },
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        },
      }
      vim.lsp.enable("ts_ls")

      -- 他の言語を追加する場合はここに
      -- vim.lsp.config.pyright = { capabilities = capabilities }
      -- vim.lsp.enable("pyright")

      -- Inlay Hint の有効/無効状態を管理
      vim.g.inlay_hint_enabled = true
      vim.lsp.inlay_hint.enable(true)

      vim.api.nvim_create_autocmd("InsertEnter", {
        callback = function()
          if vim.g.inlay_hint_enabled then
            vim.lsp.inlay_hint.enable(false, { bufnr = 0 })
          end
        end,
      })
      vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
          if vim.g.inlay_hint_enabled then
            vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
          end
        end,
      })

      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- アイコン (他: "■", "▎", "»")
          spacing = 4, -- コードとの間隔
          source = "if_many", -- ソース表示 (true, false, "if_many")
          severity_sort = true, -- 重要度順
        },
      })
      vim.keymap.set("n", "<leader>gh", function()
        vim.g.inlay_hint_enabled = not vim.g.inlay_hint_enabled
        vim.lsp.inlay_hint.enable(vim.g.inlay_hint_enabled)
      end, { desc = "Toggle Inlay Hints" })
      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename" })
    end,
  },

  -- フォーマッター
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          python = { "black" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>lf", function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = "Format" })
    end,
  },
  --diagnostics
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>dd", "<cmd>Trouble diagnostics toggle<CR>",              desc = "Diagnostics" },
      { "<leader>dD", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
      { "<leader>dl", "<cmd>Trouble loclist toggle<CR>",                  desc = "Location list" },
      { "<leader>dq", "<cmd>Trouble qflist toggle<CR>",                   desc = "Quickfix" },
    },
    opts = {}
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {}
  }
}
