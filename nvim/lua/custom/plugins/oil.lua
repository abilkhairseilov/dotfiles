return {
	"stevearc/oil.nvim",
	opts = {
		vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory (oil)" })
	}
}
