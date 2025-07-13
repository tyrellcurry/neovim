return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        -- ESLint diagnostics with explicit filetypes
        require('none-ls.diagnostics.eslint_d').with {
          filetypes = {
            'javascript',
            'javascriptreact',
          },
        },
      },
      -- Enable debug mode to see what's happening
      -- test
      debug = true,
    }
  end,
}
