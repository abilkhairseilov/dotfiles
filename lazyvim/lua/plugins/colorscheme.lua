return {
  -- add gruvbox
  { "rose-pine/neovim", name = "rose-pine" },
  { "neanias/everforest-nvim" },
  { "rebelot/kanagawa.nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
