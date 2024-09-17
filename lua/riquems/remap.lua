vim.g.mapleader = " "
vim.keymap.set({ "i", "n", "v" }, "<C-e>", vim.cmd.Ex)
vim.keymap.set({ "i", "n", "v" }, "<C-s>", function()
    vim.cmd("w")
end)

vim.keymap.set({ "i", "n", "v" }, "<Tab>", "<cmd>cnext<CR>")
vim.keymap.set({ "i", "n", "v" }, "<S-Tab>", "<cmd>cprev<CR>")
