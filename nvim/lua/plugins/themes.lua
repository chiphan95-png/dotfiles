return {
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         style = "night",
    --         transparent = true,
    --     },
    --     config = function(_, opts)
    --         require("tokyonight").setup(opts)
    --         vim.cmd.colorscheme("tokyonight")
    --     end,
    -- },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     lazy = false, -- load gruvbox during nvim startup
    --     priority = 1000 , -- set high priority (load before other plugins loads)
    --     opts = {
    --         contrast = "", -- can be "hard", "soft" or an empty string
    --         transparent_mode = true, 
    --     },
    --     config = function(_, opts)
    --         require("gruvbox").setup(opts)
    --         vim.o.background = "dark"
    --         vim.cmd.colorscheme("gruvbox")
    --     end,
    -- },

    -- {
    --   'sainnhe/edge',
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     -- Optionally configure and load the colorscheme
    --     -- directly inside the plugin declaration.
    --     vim.g.edge_enable_italic = true
    --     vim.cmd.colorscheme('edge')
    --   end
    -- }
    
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        config = function()
            -- Optional settings (must be set BEFORE calling colorscheme)
            vim.g.sonokai_style = "atlantis" -- "default", "atlantis", "andromeda", "shusia", "maia", "espresso"
            vim.g.sonokai_enable_italic = 1
            vim.g.sonokai_transparent_background = 1 -- matches your transparent_mode in gruvbox

            vim.cmd.colorscheme("sonokai")
        end,
    }

}
