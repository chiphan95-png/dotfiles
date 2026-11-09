-- File shortcuts
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Open file diagnostic pop-up(cursor on the line with errors) 
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- Move between windows in nvim (trees, terminal, CLI)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Move seleced line in "Visual mode"
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Move selected line in "Normal mode"
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })

-- Move selected line in "Insert mode"
vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })

-- Keep cursor centered when scrolling with Ctrl+d and Ctrl+u
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center cursor"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center cursor"})

-- Buffer navigations
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { desc = "Delete all others buffer, keep the current ones!!" })

-- Open Terminal on the right side for AI in CLI form
vim.keymap.set("n", "<leader>t", "<cmd>vsplit | terminal<CR>", { desc = "Terminal (right split)" })

-- Exit the Terminal 
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Move directly form the terminal in to another windows (neotree, nvim typing..)
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Window left" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Window down" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Window up" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Window right" })

