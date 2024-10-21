vim.g.mapleader = " "
-- Remaps for netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)
vim.keymap.set("n", "<leader>ve", vim.cmd.Vexplore)
vim.keymap.set("n", "<leader>se", vim.cmd.Sexplore)

-- Remap window related moves.
vim.keymap.set("n", "<leader>h", "<C-w>h") -- left
vim.keymap.set("n", "<leader>l", "<C-w>l") -- right
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>H", "<C-w>H")
vim.keymap.set("n", "<leader>L", "<C-w>L")
vim.keymap.set("n", "<leader>J", "<C-w>J")
vim.keymap.set("n", "<leader>K", "<C-w>K")

-- Indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- Allow to move selected parts up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Middle page jump with cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Never loose pasted yank stuff
--vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("x", "<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
-- This copies to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "v", "n" }, "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Delete into the black-hole register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc>:w!<cr>")
vim.keymap.set({ "n", "i" }, "<C-q>", "<Esc>:qa!<cr>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

-- TODO: usable ?
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Navigate easily in the quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")


vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
