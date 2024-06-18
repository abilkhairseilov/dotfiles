return {

  -- Kanagawa
  {
    'rebelot/kanagawa.nvim',
  },

  -- Theme inspired by Atom
  {
    'navarasu/onedark.nvim',
  },

  {
    'sainnhe/gruvbox-material',
    config = function()
      -- vim.cmd [[colorscheme gruvbox-material]]
    end,
  },
  {
    'gbprod/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'nord'
      vim.cmd [[colorscheme nord]]
    end,
  },
}
