-- Change from plug to lazy.nvim
--Plug 'prettier/vim-prettier', {
--  \ 'do': 'yarn install --frozen-lockfile --production',
--  \ 'branch': 'release/0.x'
--  \ }

return {
  "prettier/vim-prettier",
  lazy = false,
  config = function()
    vim.g["prettier#autoformat"] = 1
    vim.g["prettier#autoformat_require_pragma"] = 0
    vim.g["prettier#autoformat_config_file"] = vim.fn.expand("~/.config/nvim/.prettierrc")
  end,
  run = "yarn install --frozen-lockfile --production",
  branch = "release/0.x",
}
