return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',

      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    }
  },
  config = function()

    require('telescope').setup{
      defaults = {
        layout_strategy = 'vertical',
        path_display = function(opts, path)
          local tail = require("telescope.utils").path_tail(path)
          return string.format("%s (%s)", tail, path), { { { 1, #tail }, "Constant" } }
        end,
         layout_config = {
          -- width = function(_, max_columns, _)
            --   return math.min(max_columns, 120)
            -- end,
            height = 0.9,
            preview_cutoff = 0,
            preview_height = 0.6,
            prompt_position = 'bottom',
            -- function(_, _, max_lines)
              --   return math.min(max_lines, 35)
              -- end,
            },
            -- border = true,
            sorting_strategy = "ascending",
          },
          pickers = {
            -- find_files = {
              -- }
            },
            extensions = {
              fzf = {}
            }
          }
          require('telescope').load_extension('fzf')

          local builtin = require 'telescope.builtin'
          vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
          vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
          vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
          vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
          vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
          vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
          vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
          vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[S]earch [R]esume' })
          vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
          vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
          vim.keymap.set('n', '<leader>fc', function()
            builtin.find_files {
              cwd = vim.fn.stdpath('config')
            }
          end)
        end,
      }
