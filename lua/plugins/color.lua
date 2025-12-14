return {
  -- the colorscheme should be available when starting Neovim
  {
    "catppuccin/nvim"
    ,
    name = "catppuccin"
    ,
    priority = 1000
    ,
    opts = {
      flavour = "mocha",
      transparent_background = true
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd([[colorscheme catppuccin]])

      -- 全ての背景を透明にする
      local groups = {
        "Normal", "NormalNC", "NormalFloat",
        "SignColumn", "EndOfBuffer", "MsgArea",
        "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer",
        "BufferTabpageFill", "BufferInactive", "BufferVisible",
        "StatusLine", "StatusLineNC",
        -- 枠線関連
        "FloatBorder", "WinSeparator", "VertSplit",
        "NvimTreeWinSeparator", "NvimTreeVertSplit",
        "TelescopeBorder", "TelescopePromptBorder", "TelescopeResultsBorder", "TelescopePreviewBorder",
        "WhichKeyBorder", "LspInfoBorder",
        "NoiceCmdlinePopupBorder", "NoiceCmdlinePopupBorderSearch",
        "WhichKeyTitle", "WhichKeyNormal", "WhichKeyFloat",
        "TelescopeTitle", "TelescopePromptTitle", "TelescopeResultsTitle", "TelescopePreviewTitle",
        "TelescopeNormal", "TelescopePromptNormal", "TelescopeResultsNormal", "TelescopePreviewNormal",
      }
      for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "NONE" })
      end
    end,
  },
  { "levouh/tint.nvim", opts = {} }
}
