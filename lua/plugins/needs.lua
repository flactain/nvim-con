return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua"
      , "vim"
      , "vimdoc"
      , "markdown"
      , "markdown_inline" },
      auto_install = true,
      highlight = { enable = true },
    },
  },
}
