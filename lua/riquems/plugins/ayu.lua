return {
   "Luxed/ayu-vim",
   config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("ayu")

      vim.api.nvim_set_hl(0, 'DiffNormal', { fg = '#888888', bg = '#0f1419' })
      vim.api.nvim_set_hl(0, 'DiffChange', { fg = '#888888' })
      vim.api.nvim_set_hl(0, 'DiffText', { fg = '#FF9900', bg = '#222200' })
      vim.api.nvim_set_hl(0, 'DiffAdd', { fg = '#00EE00', bg = '#002200' })
      vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#FF5555' })
   end
}
