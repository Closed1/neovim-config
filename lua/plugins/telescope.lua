return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set({ "n", "t" }, "<leader>a", ":Telescope buffers<CR>", {}) --change between buffers
			vim.keymap.set("n", "<leader>t", ":terminal<CR>", {}) -- quick open terminal
			vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { silent = true }) -- exit terminal mode
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fj", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>w", builtin.colorscheme, {})
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
