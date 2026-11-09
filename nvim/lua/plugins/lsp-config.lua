return {
    -- 1. Mason: Tool manager for Language Servers Protocal (LSP)
    {
        "williamboman/mason.nvim",
        opts = {},
    },

    -- 2. Mason LSPConfig: Automatically installs missing LSPs
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "pyright", "jdtls" },
            -- Pyright is enabled explicitly below. Java is started by nvim-jdtls
            -- from ftplugin/java.lua, so don't auto-enable it here.
            automatic_enable = false,
        },
    },
    -- 3. LSP Configuration
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            vim.lsp.config("pyright", {
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })
            vim.lsp.enable("pyright")

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },
}
