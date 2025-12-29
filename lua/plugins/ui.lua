return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.setup
      sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
        NvimTree = true,
        -- Or, specify the text used for the offset:
        undotree = {
          text = 'undotree',
          align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
        },
        -- Or, specify the event which the sidebar executes when leaving:
        ['neo-tree'] = { event = 'BufWipeout' },
        -- Or, specify all three
        Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
      },
    },
    keys = {
      { "<leader>bj", "<cmd>BufferPick<CR>",  desc = "Pick Buffer" },
      { "<leader>bc", "<cmd>BufferClose<CR>", desc = "Close Buffer" },
      { "<leader>bw", "<cmd>w<CR>",           desc = "WriteBuffer" }

    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'nvim-lualine/lualine.nvim',
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = "jellybeans",
      ignore_focus = "NvimTree"
    }
  },
  -- toggleterm
  { 'akinsho/toggleterm.nvim', version = "*", opts = {} },
  -- notice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = true,
          },
          signature = {
            enabled = true,
          },
        },
        presets = {
          lsp_doc_border = true,
        },
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "doom",
      config = {
        header = {
          "",
          "███╗   ███╗ ██████╗ ██████╗ ██╗██╗   ██╗██╗███╗   ███╗",
          "████╗ ████║██╔═══██╗██╔══██╗██║██║   ██║██║████╗ ████║",
          "██╔████╔██║██║   ██║██████╔╝██║██║   ██║██║██╔████╔██║",
          "██║╚██╔╝██║██║   ██║██╔══██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║ ╚═╝ ██║╚██████╔╝██║  ██║██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "",
        },
        center = {
          { icon = "  ", desc = "Find File",    key = "f", action = "Telescope find_files" },
          { icon = "  ", desc = "Recent Files", key = "r", action = "Telescope oldfiles" },
          { icon = "  ", desc = "Find Word",    key = "g", action = "Telescope live_grep" },
          { icon = "  ", desc = "New File",     key = "n", action = "enew" },
          { icon = "  ", desc = "Config",       key = "c", action = "e ~/.config/nvim/init.lua" },
          { icon = "  ", desc = "Quit",         key = "q", action = "qa" },
        },
        footer = { "", "🚀 Happy Coding!" },
      },
    },
  },

  -- contextを上部似表示するやつ
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufNewFile", "BufReadPre" },
    opts = {}
  },
  -- パンくずリスト
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    config = function()
      local dropbar_api = require('dropbar.api')
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
    end
  },
  -- chunkをつなぐやつ
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = {
        enable = true
      },
      indent = {
        enable = true
      },
    }
  },
  -- gitの履歴表示
  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  }
}
