return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				-- Language Servers
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"phpactor",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.phpactor.setup({
				capabilities = capabilities,
			})
			vim.diagnostic.config({
				virtual_text = {
					prefix = "",
					severity_sort = true,
				},
				signs = true,
				underline = true,
				update_in_insert = false,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- CTRL + K
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {}) -- <leader> + g + d
			-- More lsp buf options in :help vim.lsp.buf
		end,
	},
}
