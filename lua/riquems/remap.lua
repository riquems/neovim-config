vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<C-Right>", "w")
vim.keymap.set({ "n", "v" }, "<C-Left>", "b")

vim.keymap.set({ "i", "n", "v" }, "<C-e>", "<cmd>Oil<CR>")
vim.keymap.set({ "i", "n", "v" }, "<C-s>", function()
   vim.cmd("w")
end)

-- doesn't work because Shift + Tab conflicts with CTRL + I in terminals
-- vim.keymap.set({ "i", "n", "v" }, "<Tab>", "<cmd>cnext<CR>")
-- vim.keymap.set({ "i", "n", "v" }, "<S-Tab>", "<cmd>cprev<CR>")

vim.keymap.set({ "n" }, "]q", "<cmd>cnext<CR>")
vim.keymap.set({ "n" }, "[q", "<cmd>cprev<CR>")
vim.keymap.set({ "n" }, "qo", "<cmd>copen<CR>")
vim.keymap.set({ "n" }, "qc", "<cmd>cclose<CR>")
