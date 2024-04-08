--local conform = require("conform")
--
--conform.setup({
--	formatters_by_ft = {
--		javascript = { "prettier" },
--		typescript = { "prettier" },
--		javascriptreact = { "prettier" },
--		typescriptreact = { "prettier" },
--		-- Conform will run multiple formatters sequentially
--		go = { "goimports", "gofmt" },
--		css = { "prettier" },
--		html = { "prettier" },
--		json = { "prettier" },
--		yaml = { "prettier" },
--		markdown = { "prettier" },
--		lua = { "stylua" },
--		ruby = { "rubocop" },
--		sql = { "sql_formatter" },
--		terraform = { "terraform_fmt" },
--	},
--	format_on_save = {
--		lsp_fallback = true,
--		async = false,
--		timeout_ms = 1000,
--	},
--	-- Set the log level. Use `:ConformInfo` to see the location of the log file.
--	log_level = vim.log.levels.ERROR,
--})
--vim.keymap.set({ "n", "v" }, "<leader>f", function()
--	conform.format({
--		lsp_fallback = true,
--		async = false,
--		timeout_ms = 1000,
--	})
--end, { desc = "Format file or range (in visual mode)" })

-- Format on save
--local formatAutogroup = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--	pattern = "*",
--	callback = function(args)
--		require("conform").format({ bufnr = args.buf })
--	end,
--	group = formatAutogroup,
--})

-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
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
			require("formatter.filetypes.javascript").prettier,
		},

		vue = {
			require("formatter.filetypes.javascript").prettier,
		},

		json = {
			require("formatter.filetypes.json").fixjson,
		},

		markdown = {
			require("formatter.filetypes.javascript").prettier,
		},

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
