return {
	{
		"mhartington/formatter.nvim",
		config = function()
			-- Utilities for creating configurations
			local util = require("formatter.util")

			-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
			require("formatter").setup({
				-- Enable or disable logging
				logging = true,
				-- Set the log level
				log_level = vim.log.levels.WARN,
				-- Checks for a formatter inside node_modules before going to $Path
				try_node_modules = true,
				-- All formatter configurations are opt-in
				filetype = {
					-- Formatter configurations for filetype "lua" go here
					-- and will be executed in order
					lua = {
						-- "formatter.filetypes.lua" defines default configurations for the
						-- "lua" filetype
						require("formatter.filetypes.lua").stylua,
					},

					javascript = {
						require("formatter.filetypes.javascript").prettier,
					},

					html = {
						require("formatter.filetypes.html").prettier,
					},

					css = {
						require("formatter.filetypes.css").prettier,
					},

					typescript = {
						require("formatter.filetypes.typescript").prettier,
					},

					vue = {
						require("formatter.filetypes.javascript").prettier,
					},

					yaml = {
						require("formatter.filetypes.yaml").prettier,
					},

					json = {
						require("formatter.filetypes.json").fixjson,
					},

					markdown = {
						require("formatter.filetypes.markdown").prettier,
					},

					ruby = {
						require("formatter.filetypes.ruby").rubocop,
					},

					toml = {
						require("formatter.filetypes.toml").taplo,
					},

					terraform = {
						require("formatter.filetypes.terraform").terraformfmt,
					},

					--	sh = {
					--		require("formatter.filetypes.").shfmt,
					--require("formatter.filetypes.fish").fishindent,
					--	},

					-- Use the special "*" filetype for defining formatter configurations on
					-- any filetype
					["*"] = {
						-- "formatter.filetypes.any" defines default configurations for any
						-- filetype
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})

			vim.keymap.set("n", "<leader>f", vim.cmd.Format, {})
			vim.keymap.set("n", "<leader>F", vim.cmd.FormatWrite, {})

			-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
			-- 	callback = function()
			-- 		vim.cmd.Format()
			-- 	end,
			-- })

			-- Format on save
			local formatAutogroup = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "*",
				callback = function()
					vim.cmd("FormatWrite")
				end,
				group = formatAutogroup,
			})
		end,
	},
}
