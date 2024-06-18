return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        center = {
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = '-',
            keymap = 'SPC',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Oil',
          },
          {
            icon = ' ',
            desc = 'Find Dotfiles',
            key = '`',
            keymap = 'SPC',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Oil ~/Repos/dotfiles/nvim/',
          },
        },
        footer = {
        }, --your footer
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons', 'folke/neodev.nvim' } },
}
