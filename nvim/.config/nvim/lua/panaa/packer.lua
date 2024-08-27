-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		require("telescope").setup({
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		}),
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Color scheme
	use("EdenEast/nightfox.nvim")

	-- Syntax highlighting on steroids
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Undo trash box
	use("mbbill/undotree")

	-- Best LSP out there
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage the language servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	-- All-in-one formatter seems slow be carefull
	use("mhartington/formatter.nvim")

	-- git related stuff
	-- git wrapper
	use("tpope/vim-fugitive")

	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup({
				debug = false,
				default_mappings = true, -- disable buffer local mapping created by this plugin
				default_commands = true, -- disable commands created by this plugin
				disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
				list_opener = "copen", -- command or function to open the conflicts list
				highlights = { -- They must have background color, otherwise the default color will be used
					incoming = "DiffAdd",
					current = "DiffText",
				},
			})
		end,
	})

	use("lewis6991/gitsigns.nvim")

	-- git blame
	use("f-person/git-blame.nvim")

	-- IDE sidebar Tree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})
end)
