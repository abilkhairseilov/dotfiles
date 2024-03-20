return {
	{'akinsho/toggleterm.nvim', version = "*", opts = {
			  insert_mappings = false, -- whether or not the open mapping applies in insert mode
			  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			  direction = 'float',
			  open_mapping = [[<c-`>]],
			  vim.keymap.set('n', "<leader>tt", ":ToggleTerm dir=% direction=float name=Terminal<CR>", {silent = true, desc = "[T]erminal"})
		}
	}
}
