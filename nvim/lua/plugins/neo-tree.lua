return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",       -- already installed (telescope/harpoon use it)
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false, -- needed so `nvim .` opens neo-tree (netrw is disabled)
        keys = {
            { "<leader>e",  "<cmd>Neotree toggle<CR>",                  desc = "Explorer: files" },
            { "<leader>be", "<cmd>Neotree buffers toggle<CR>",          desc = "Explorer: buffers" },
            { "<leader>ge", "<cmd>Neotree git_status toggle<CR>",       desc = "Explorer: git" },
            { "<leader>bf", "<cmd>Neotree buffers float toggle<CR>",    desc = "Buffers (float)" },
        },
        opts = {
            -- close_if_last_window = false,      -- quit nvim if neo-tree is the only window left
            source_selector = {
                winbar = true,                -- tabs at the top: Files | Buffers | Git
            },
            window = {
                width = 30,                   -- same as your old nvim-tree width
            },
            filesystem = {
                follow_current_file = { enabled = true }, -- highlight the file you're editing
                group_empty_dirs = true,                  -- same as your old `group_empty`
                hijack_netrw_behavior = "open_current",
                use_libuv_file_watcher = true,            -- auto refresh on file changes
                filtered_items = {
                    hide_dotfiles = false,                -- same as your old `dotfiles = false`
                    hide_gitignored = false,
                },
            },
            buffers = {
                follow_current_file = { enabled = true },
                group_empty_dirs = true,
                show_unloaded = true,
                window = {
                    mappings = {
                        ["d"] = "buffer_delete",  -- press `d` on a buffer to close it
                        ["bd"] = "buffer_delete",
                    },
                },
            },
        },
    },
}
