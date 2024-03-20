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
      vim.cmd [[colorscheme gruvbox-material]]
    end,
  },
}
