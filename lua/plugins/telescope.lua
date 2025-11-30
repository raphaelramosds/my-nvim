return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.1.9",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
        local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<C-n>', builtin.live_grep, {}) -- sudo apt-get install ripgrp
            vim.keymap.set('n', '<C-k>', ':Neotree filesystem reveal left<CR>', {})
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
