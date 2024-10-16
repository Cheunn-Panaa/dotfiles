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
				lsp_zero.preset("recommended")
                ---@diagnostic disable-next-line: unused-local
                lsp_zero.on_attach(function(client, bufnr)
                    lsp_zero.default_keymaps({ buffer = bufnr })
                end)
				lsp_zero.on_attach(function(client, bufnr)
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
				end)

				lsp_zero.extend_lspconfig({
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
				require("mason").setup({})
				require("mason-lspconfig").setup({
					ensure_installed = {
						"dockerls",
						"docker_compose_language_service",
						"eslint",
						"gopls",
						"jsonls",
						"tsserver",
						"lua_ls",
						"marksman", --MARKDOWN
						"sqls",
						"taplo", -- TOML
						"yamlls",
						"terraformls",
					},
					automatic_installation = true,
					handlers = {
						lsp_zero.default_setup,
					},
				})

				-- Language server configuration
				local lsp_config = require("lspconfig")

				lsp_config.dockerls.setup({})

				lsp_config.docker_compose_language_service.setup({})

				lsp_config.gopls.setup({})

				-- MARKDOWN LSP
				lsp_config.marksman.setup({})

				lsp_config.sqls.setup({})

				lsp_config.terraformls.setup({})

				lsp_config.jsonls.setup({
					filetypes = { "json", "jsonc" },
					provideFormatter = true,
					capabilities = capabilities,
				})

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

				-- TODO: Consider not to setup at all, since volar does decent job already.
				lsp_config.tsserver.setup({ autostart = false })

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
				lsp_config.volar.setup({
					root_dir = util.root_pattern(".git")(fname),
				})
				local cmp = require("cmp")
				local cmp_select = { behavior = cmp.SelectBehavior.Select }

				cmp.setup({
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
				})

				lsp_zero.set_preferences({
					suggest_lsp_servers = false,
					sign_icons = {
						error = "E",
						warn = "W",
						hint = "H",
						info = "I",
					},
				})
			end,
		},
	},
}
