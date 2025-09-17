vim.opt.fillchars:append('diff:/')

vim.api.nvim_create_augroup('DiffMode', { clear = true })
vim.api.nvim_create_autocmd('VimEnter', {
   group = 'DiffMode',
   pattern = '*',
   callback = function()
      if vim.wo.diff then
         vim.cmd('windo syntax off')
         vim.cmd('windo set winhighlight=Normal:DiffNormal')
      end
   end
})

vim.opt.diffopt:append('context:0')

