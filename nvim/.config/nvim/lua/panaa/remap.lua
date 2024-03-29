vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)
vim.keymap.set("n", "<leader>ve", vim.cmd.Vexplore)
vim.keymap.set("n", "<leader>se", vim.cmd.Sexplore)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "v", "n" }, "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc>:w!<cr>")
vim.keymap.set({ "n", "i" }, "<C-q>", "<Esc>:qa!<cr>")


vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/dotfiles/nvim/.config/nvim/lua/panaa/packer.lua<CR>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
