-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- original Vim Setting
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Keymaps
-- Manipulate
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear Serach Highlight" })
vim.keymap.set('i', '<A-h>', '<Left>')
vim.keymap.set('i', '<A-j>', '<Down>')
vim.keymap.set('i', '<A-k>', '<Up>')
vim.keymap.set('i', '<A-l>', '<Right>')
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Plugin: nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

--maison
vim.env.PATH = vim.fn.expand("~/.local/share/nvim/mason/bin") .. ":" .. vim.env.PATH

-- ToggleTerm
vim.keymap.set({ "n", "t" }, "<leader>th", "<cmd>1ToggleTerm direction=horizontal<CR>", { desc = "Terminal bottom" })
vim.keymap.set({ "n", "t" }, "<leader>tv", "<cmd>2ToggleTerm direction=vertical<CR>", { desc = "Terminal vertical" })
vim.keymap.set({ "n", "t" }, "<leader>tf", "<cmd>3ToggleTerm direction=float<CR>", { desc = "Terminal float" })

-- signcolumn
vim.opt.number = true
-- clipboard
vim.opt.clipboard = "unnamedplus"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  rocks = {
    enabled = false
  }
})
