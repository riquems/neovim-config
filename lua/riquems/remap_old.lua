local all_modes = { "i", "n", "v" }

-- CTRL + E = Explorer
vim.keymap.set(all_modes, "<C-e>", vim.cmd.Ex)

-- CTRL + S = Save
vim.keymap.set(all_modes, "<C-s>", function() vim.cmd("w") end)

-- CTRL + C without selection = Copy line
vim.keymap.set(all_modes, "<C-C>", '"+y')

-- CTRL + V = paste
vim.keymap.set(all_modes, "<C-V>", '"+gP')

-- CTRL + X = cut
vim.keymap.set(all_modes, "<C-X>", function()
	local vstart = vim.fn.getpos("'<")

	local vend = vim.fn.getpos("'>")

	print(vstart[2])

	local line_start = vstart[2]
	local line_end = vend[2]

	-- or use api.nvim_buf_get_lines
	--local lines = vim.fn.getline(line_start,line_end)

	-- Join the lines into the selected text
	--local selected_text = table.concat(lines, "\n")
	--print(selected_text)
	--vim.cmd(".d")
end)

-- CTRL + Z = undo
vim.keymap.set(all_modes, "<C-z>", "<C-O>u")

-- CTRL + Y = redo
vim.keymap.set(all_modes, "<C-y>", "<C-O>:redo<CR>")

-- Select with Shift

-- vim.keymap.set(all_modes, "<S-Left>", "<C-O>v<Left>")
-- vim.keymap.set(all_modes, "<S-Right>", "<C-O>v<Right>")
-- vim.keymap.set(all_modes, "<S-Up>", "<C-O>v<Up>")
-- vim.keymap.set(all_modes, "<S-Down>", "<C-O>v<Down>")

-- vim.keymap.set(all_modes


