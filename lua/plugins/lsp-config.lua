return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {}
            },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                -- Language Servers
                ensure_installed = {
                    "lua_ls" 
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("*", {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- CTRL + K (More lsp buf options in :help vim.lsp.buf)
        end
    }
}
