-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 15,
      open_mapping = [[<C-\>]],
      direction = 'horizontal',
    },
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
          ['q'] = 'actions.close',
        },
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  -- nvim v0.8.0
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'andymass/vim-matchup',
    init = function()
      -- modify your configuration vars here
      vim.g.matchup_treesitter_stopline = 500

      -- or call the setup function provided as a helper. It defines the
      -- configuration vars for you
      require('match-up').setup {
        treesitter = {
          stopline = 500,
        },
      }
    end,
    -- or use the `opts` mechanism built into `lazy.nvim`. It calls
    -- `require('match-up').setup` under the hood
    ---@type matchup.Config
    opts = {
      treesitter = {
        stopline = 500,
      },
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-go',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-go' { -- opts masuk sini
            experimental = {
              test_table = true,
            },
            args = { '-count=1', '-timeout=60s' },
          },
        },
      }
    end,
  },
}
