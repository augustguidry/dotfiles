-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[colorscheme solarized-osaka]])

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal linebreak spell",
})
