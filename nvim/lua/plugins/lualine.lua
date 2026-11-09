return {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = { theme = "powerline", globalstatus = true },
            tabline = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { "filetype" },
                lualine_z = { "location" },
            },
            sections = {
                lualine_a = {{
                    "buffers",
                    mode = 2,
                    show_filename_only = true,
                    show_modified_status = true,
                }},
                lualine_b = {},
                lualine_c = {},
                lualine_x = { "encoding", "fileformat" },
                lualine_y = { "progress" },
                lualine_z = {},
            },
        },
        keys = {
            { "<Tab>", "<cmd>bnext<CR>", desc = "Next buffer" },
            { "<S-Tab>", "<cmd>bprev<CR>", desc = "Previous buffer" },
            { "<leader>x", "<cmd>bdelete<CR>", desc = "Close buffer" },
        },
}
