return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local languages = {
				"python",
				"java",
				"lua",
				"bash",
				"json",
				"html",
				"css",
				"javascript",
				"htmldjango",
				"sql",
				"typescript",
			}

			require("nvim-treesitter").setup()
			require("nvim-treesitter").install(languages)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = languages,
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},
}
