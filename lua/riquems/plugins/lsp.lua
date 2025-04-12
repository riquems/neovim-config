return {
   "neovim/nvim-lspconfig",
   dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
      "Hoffs/omnisharp-extended-lsp.nvim"
   },

   config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
         ensure_installed = {
            "lua_ls",
            "omnisharp",
            "clangd",
            "emmet_ls",
            "angularls"
         },
         handlers = {
            function(server_name) -- default handler (optional)
               lspconfig[server_name].setup {
                  capabilities = capabilities
               }
            end,

            angularls = function()
               local project_path = vim.uv.cwd()

               local cmd = {
                  "ngserver",
                  "--stdio",
                  "--tsProbeLocations", project_path,
                  "--ngProbeLocations", project_path
               }

               lspconfig.angularls.setup{
                  cmd = cmd,
                  on_new_config = function(new_config,new_root_dir)
                     new_config.cmd = cmd
                  end,
               }
            end,

            omnisharp = function()
               lspconfig.omnisharp.setup({
                  capabilities = capabilities,
                  handlers = {
                     ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
                     ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
                     ["textDocument/references"] = require('omnisharp_extended').references_handler,
                     ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
                  }
               })
            end
         }
      })

      lspconfig.hls.setup({})

      vim.diagnostic.config({
         -- update_in_insert = true,
         float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
         },
      })
   end
}
