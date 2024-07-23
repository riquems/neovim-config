vim.g.mapleader = " "
vim.keymap.set({ "i", "n", "v" }, "<C-e>", vim.cmd.Ex)
vim.keymap.set({ "i", "n", "v" }, "<C-s>", function()
    vim.cmd("w")
end)
