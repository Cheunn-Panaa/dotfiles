vim.g.mapleader = " "
-- Remaps for netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "Go to current folder" })
vim.keymap.set("n", "<leader>ve", vim.cmd.Vexplore, { desc = "Go to current folder in a vertically splitted window" })
vim.keymap.set("n", "<leader>se", vim.cmd.Sexplore, { desc = "Go to current folder in a horizontally splitted window" })

-- Remap window related moves.
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to the left window" }) -- left
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to the right window" }) -- right
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to the window below" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to the window above" })
vim.keymap.set("n", "<leader>H", "<C-w>H", { desc = "Make the current window full height on far left" })
vim.keymap.set("n", "<leader>L", "<C-w>L", { desc = "Make the current window full height on far right" })
vim.keymap.set("n", "<leader>J", "<C-w>J", { desc = "Make the current window full width at the very bottom" })
vim.keymap.set("n", "<leader>K", "<C-w>K", { desc = "Make the current window full width at the very top" })

-- Indentation
vim.keymap.set("v", "<", "<gv", { desc = "Indent block to the left, repeat for X amount of indentation" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent block to the right, repeat for X amount of indentation" })

-- Allow to move selected parts up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the whole block one line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the whole block one line up" })

-- TODO: should i keep this ??
vim.keymap.set("n", "J", "mzJ`z", { desc = "Bring next line up" })

-- Middle page jump with cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv", { desc = "Navigate to previous occurence of search pattern" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Navigate to next occurence of search pattern" })

-- Never loose pasted yank stuff
--vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over stuff without loosing the yank" })

-- next greatest remap ever : asbjornHaland
-- This copies to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "v", "n" }, "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Delete into the black-hole register
vim.keymap.set({"n", "v"}, "<leader>d", '"_d', { desc = "delete to a black whole (it is not yanked)" })

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
