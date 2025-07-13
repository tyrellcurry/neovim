return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'eslint_d', 'prettier' },
        javascriptreact = { 'eslint_d', 'prettier' },
        typescript = { 'eslint_d', 'prettier' },
        typescriptreact = { 'eslint_d', 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        scss = { 'prettier' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        eslint_d = {
          -- Custom configuration for eslint_d
          args = { '--fix-to-stdout', '--stdin', '--stdin-filename', '$FILENAME' },
        },
      },
    }
  end,
}
