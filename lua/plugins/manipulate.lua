return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "simeji/winresizer",
    keys = { "<C-e>" }, -- デフォルトキーで遅延読み込み
    init = function()
      vim.g.winresizer_horiz_resize = 2
      vim.g.winresizer_vert_resize = 2
    end
  },
  {
    'phaazon/hop.nvim',
    keys = {
      { "<leader>hs", "<cmd>HopWord<CR>",  desc = "Hop to word" },
      { "<leader>hS", "<cmd>HopLine<CR>",  desc = "Hop to Line" },
      { "<leader>hf", "<cmd>HopChar2<CR>", desc = "Hop to Line with Char2" },
    },
    opts = {}
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>",            desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",             desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",               desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",             desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>",              desc = "Recent files" },
      { "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>",  desc = "Document symbols" },
      { "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace symbols" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
        },
      })
      telescope.load_extension("fzf")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        delay = 300,
        win = {
          border = "rounded", -- none, single, double, rounded, shadow
          title = true,
          title_pos = "left"
        },
      })

      wk.add({
        { "<leader>b", group = "Buffer" },
        { "<leader>f", group = "Find" },
        { "<leader>d", group = "Document" },
        { "<leader>w", group = "Workspace" },
        { "<leader>t", group = "Terminal" },
        { "<leader>l", group = "LSP" },
        { "<leader>h", group = "Hop" },
        { "s",         desc = "Replace with register" },
        { "si",        group = "inner" },
        { "sa",        group = "around" },
      })
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    opts = {}
  },
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
    init = function()
      -- リーダーキーを","に設定（デフォルトは<C-y>）
      vim.g.user_emmet_leader_key = ","
      -- JSX: {expression} の周りにクォートを付けない
      vim.g.user_emmet_settings = {
        javascriptreact = {
          attr_quotes = "none",
        },
        typescriptreact = {
          attr_quotes = "none",
        },
      }
    end,
  },
  {
    "kana/vim-operator-replace",
    dependencies = { "kana/vim-operator-user" },
    keys = {
      { "s", "<Plug>(operator-replace)", mode = { "n", "x" } },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }
}
