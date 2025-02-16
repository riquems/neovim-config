require("riquems.set")
require("riquems.remap")
require("riquems.lazy_init")

vim.g.python3_host_prog = "/usr/bin/python3.8"

local in_wsl = vim.loop.os_uname().release:match('WSL')

if in_wsl then
   if vim.fn.executable('win32yank.exe') == 1 then
      vim.g.clipboard = {
         name = "win32yank-wsl",
         copy = {
            ["+"] = "win32yank.exe -i",
            ["*"] = "win32yank.exe -i",
         },
         paste = {
            ["+"] = "win32yank.exe -o",
            ["*"] = "win32yank.exe -o",
         },
      }
   else
      print('in wsl and win32yank is not available, clipboard may not function as expected')
   end
end

local autocmd = vim.api.nvim_create_autocmd

local function change_dir_from_argv()
   local argv = vim.fn.argv()

   if #argv > 0 then
      local path = argv[1]

      local is_dir = vim.fn.isdirectory(path) == 1

      if is_dir then
         vim.cmd('cd ' .. path)
      end
   end
end

autocmd("VimEnter", {
   callback = change_dir_from_argv
})

autocmd('LspAttach', {
   callback = function(e)
      local opts = { buffer = e.buf }
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
      vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
      vim.keymap.set({"n", "v"}, "<leader>f", function() vim.lsp.buf.format() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>fs", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "<leader>.", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>fr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
   end
})
