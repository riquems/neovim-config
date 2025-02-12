return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>d",
      "<cmd>Trouble diagnostics filter.buf=0 toggle<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>D",
      "<cmd>Trouble diagnostics toggle filter.buf=0 filter.severity=vim.diagnostic.severity.ERROR<cr>",
      desc = "Buffer Errors (Trouble)",
    },
    {
      "<leader>pd",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Project Diagnostics (Trouble)",
    },
    {
      "<leader>pD",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Project Errors (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
} 
