return {
	{
		{
			"VonHeikemen/lsp-zero.nvim",
			branch = "v4.x",
			lazy = true,
			config = false,
		},
		{
			"williamboman/mason.nvim",
			lazy = false,
			config = true,
		},
		{
			"neovim/nvim-lspconfig",
			cmd = { "LspInfo", "LspInstall", "LspStart" },
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-cmdline" },
				{ "hrsh7th/nvim-cmp" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },
			},
			config = function()
				local lsp_zero = require("lsp-zero")
				local util = require("lspconfig.util")
				-- lsp_zero.preset("recommended")
				---@diagnostic disable-next-line: unused-local
				local lsp_attach = function(client, bufnr)
					lsp_zero.default_keymaps({ buffer = bufnr })
					local opts = { buffer = bufnr } --, remap = false }

					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end, opts)
					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover()
					end, opts)
					vim.keymap.set("n", "<leader>vws", function()
						vim.lsp.buf.workspace_symbol()
					end, opts)
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float()
					end, opts)
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.goto_next()
					end, opts)
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.goto_prev()
					end, opts)
					vim.keymap.set("n", "<leader>vca", function()
						vim.lsp.buf.code_action()
					end, opts)
					vim.keymap.set("n", "<leader>vrr", function()
						vim.lsp.buf.references()
					end, opts)
					vim.keymap.set("n", "<leader>vrn", function()
						vim.lsp.buf.rename()
					end, opts)
					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end, opts)
				end

				lsp_zero.extend_lspconfig({
					lsp_attach = lsp_attach,
					sign_text = true,
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				})
				lsp_zero.setup()

				--
				--Enable (broadcasting) snippet capability for completion
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities.textDocument.completion.completionItem.snippetSupport = true

				-- make sure this servers are installed
				-- see :help lsp-zero.ensure_installed()
				-- Language server configuration
				local lsp_config = require("lspconfig")
				require("mason").setup({})
				require("mason-lspconfig").setup({
					ensure_installed = {
						"dockerls",
						"docker_compose_language_service",
						"eslint",
						"helm_ls",
						"gopls",
						"jsonls",
						"ts_ls",
						"lua_ls",
						"marksman", --MARKDOWN
						"sqls",
						"taplo", -- TOML
						"yamlls",
						"terraformls",
					},
					automatic_installation = true,
					handlers = {
						function(server_name)
							lsp_config[server_name].setup({})
						end,
						ts_ls = function()
							lsp_config.ts_ls.setup({
								filetypes = {
									"javascript",
									"typescript",
									"typescript.tsx",
									"javascriptreact",
									"javascript.jsx",
									"typescriptreact",
								},
							})
						end,
						jsonls = function()
							lsp_config.jsonls.setup({
								filetypes = { "json", "jsonc" },
								provideFormatter = true,
								capabilities = capabilities,
							})
						end,
						yamlls = function()
							lsp_config.yamlls.setup({
								on_attach = function(client)
									-- get first line of current buffer
									local firstLine = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]

									-- check if first lines begins with "apiVersion:"
									local isKubernetes = string.match(string.sub(firstLine, 1, 11), "apiVersion:")

									if isKubernetes then
										client.config.settings.yaml.schemas = {
											["Kubernetes"] = "/*.{yaml, yml}",
										}

										client.notify("workspace/didChangeConfiguration", {
											settings = client.config.settings,
										})
									end
								end,

								settings = {
									yaml = {
										schemas = { kubernetes = "globPattern" },
									},
								},
							})
						end,
						eslint = function()
							-- TODO: Consider not to setup at all, since volar does decent job already.
							lsp_config.eslint.setup({
								-- TODO: Should we run eslint everytime or have a keymap for it ?
								---@diagnostic disable-next-line: unused-local
								--on_attach = function(client, bufnr)
								--	vim.api.nvim_create_autocmd("BufWritePre", {
								--				buffer = bufnr,
								--				command = "EslintFixAll",
								--			})
								--		end,
								workingDirectories = { mode = "auto" },
							})
						end,
						lua_ls = function()
							-- (Optional) Configure lua language server for neovim
							lsp_config.lua_ls.setup({
								filetypes = { "lua" },
								settings = {
									Lua = {
										runtime = {
											-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
											version = "LuaJIT",
										},
										diagnostics = {
											-- Get the language server to recognize the `vim` global
											globals = { "vim" },
										},
										workspace = {
											-- Make the server aware of Neovim runtime files
											library = vim.api.nvim_get_runtime_file("", true),
											checkThirdParty = false,
										},
										-- Do not send telemetry data containing a randomized but unique identifier
										telemetry = {
											enable = false,
										},
									},
								},
							})
						end,
						volar = function()
							lsp_config.volar.setup({
								root_dir = util.root_pattern(".git")(fname),
							})
						end,
					},
				})

				local cmp = require("cmp")
				local cmp_select = { behavior = cmp.SelectBehavior.Select }

				cmp.setup({
					sources = { name = "nvim_lsp" },
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					mapping = cmp.mapping.preset.insert({
						["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
						["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
						["<Tab>"] = cmp.mapping.confirm({ select = true }),
						["<C-Space>"] = cmp.mapping.complete(),
					}),
					formatting = lsp_zero.cmp_format(),
				})
			end,
		},
	},
}
