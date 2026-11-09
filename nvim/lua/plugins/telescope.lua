return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = { file_ignore_patterns = { "^.git/" } },
                pickers = { find_files = { hidden = true } },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })
            telescope.load_extension("ui-select")
        end,
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Search project" },
            { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
            {
                "<leader>fc",
                function()
                    require("telescope.builtin").find_files({
                        cwd = vim.fn.expand("~/.config"),
                        hidden = true,
                    })
                end,
                desc = "Find config files",
            },
        },
    },
}
