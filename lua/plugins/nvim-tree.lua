return {
  {
    "nvim-tree/nvim-tree.lua",
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    opts = {}
  },
  -- tree sitter icons
  {
    "nvim-tree/nvim-web-devicons", opts = {}
  }
}
