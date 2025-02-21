return { 
  'echasnovski/mini.nvim', 
  version = '*',
  -- enabled = false,
  config = function() 
    require('mini.ai').setup {n_lines = 500}
    require('mini.move').setup()
    require('mini.pairs').setup()
    require('mini.surround').setup{n_lines = 500}
  end,
}
