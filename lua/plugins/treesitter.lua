return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  otps = {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown"},
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
}
