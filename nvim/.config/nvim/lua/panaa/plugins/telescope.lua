return {
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.x",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("telescope").setup({
               defaults = { file_ignore_pattern = {"node_modules"} },
			   pickers = {
		          find_files = {
			         hidden = true,
                    },
                },
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})
			vim.keymap.set("n", "<leader>vo", builtin.vim_options, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		end,
	},
}
