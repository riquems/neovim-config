return {
   { "hrsh7th/cmp-nvim-lsp" },
   { "hrsh7th/cmp-buffer" },
   { "hrsh7th/cmp-path" },
   { "hrsh7th/cmp-cmdline" },
   { "saadparwaiz1/cmp_luasnip" },
   {
      "hrsh7th/nvim-cmp",
      config = function ()
         local cmp = require('cmp')

         cmp.setup({
            snippet = {
               expand = function(args)
                  require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
               end,
            },
            mapping = cmp.mapping.preset.insert({
               ['<C-Space>'] = cmp.mapping.complete(),
               ['<Tab>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = {
               { name = 'nvim_lsp' },
               { name = 'buffer' },
               { name = 'lazydev' },
               { name = 'luasnip' },
            }
         })
      end
   },
}
