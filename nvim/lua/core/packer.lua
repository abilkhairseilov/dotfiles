-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'edkolev/tmuxline.vim'
  use 'mengelbrecht/lightline-bufferline'
  use 'junegunn/fzf.vim'
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
    require('rose-pine').setup({

	--- @usage 'auto'|'main'|'moon'|'dawn'

	variant = 'main',

	--- @usage 'main'|'moon'|'dawn'

	dark_variant = 'main',

	bold_vert_split = false,

	dim_nc_background = false,

	disable_background = false,

	disable_float_background = false,

	disable_italics = false,



	--- @usage string hex value or named color from rosepinetheme.com/palette

	groups = {

		background = 'base',

		background_nc = '_experimental_nc',

		panel = 'surface',

		panel_nc = 'base',

		border = 'highlight_med',

		comment = 'muted',

		link = 'iris',

		punctuation = 'subtle',



		error = 'love',

		hint = 'iris',

		info = 'foam',

		warn = 'gold',



		headings = {

			h1 = 'iris',

			h2 = 'foam',

			h3 = 'rose',

			h4 = 'gold',

			h5 = 'pine',

			h6 = 'foam',

		}

		-- or set all headings at once

		-- headings = 'subtle'

	},



	-- Change specific vim highlight groups

	-- https://github.com/rose-pine/neovim/wiki/Recipes

	highlight_groups = {

		ColorColumn = { bg = 'rose' },



		-- Blend colours against the "base" background

		CursorLine = { bg = 'foam', blend = 10 },

		StatusLine = { fg = 'love', bg = 'love', blend = 10 },

	}

})



-- Set colorscheme after options

vim.cmd('colorscheme rose-pine')


      end
  })

  use 'itchyny/lightline.vim'

  use {
       "nvim-telescope/telescope-file-browser.nvim",
       requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,}
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/nvim-treesitter-context");
  --use("Shougo/deoplete.nvim")
  use("dense-analysis/ale")
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")
  --use("OmniSharp/omnisharp-vim")

end)

