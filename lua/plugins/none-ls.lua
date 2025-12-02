return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Open :Mason and install all formatters and linters you listed here
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.duster,
				null_ls.builtins.formatting.phpcsfixer,
				null_ls.builtins.formatting.prettier,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
