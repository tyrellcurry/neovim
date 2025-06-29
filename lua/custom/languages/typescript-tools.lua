return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      -- Enable diagnostics from tsserver
      tsserver_plugins = {
        -- Ensure @typescript-eslint/parser is used
        '@typescript-eslint/parser',
      },
      tsserver_file_preferences = {
        -- Customize tsserver behavior
        includeInlayParameterNameHints = 'all',
        includeInlayFunctionLikeReturnTypeHints = true,
        includeCompletionsForModuleExports = true,
      },
      -- Ensure diagnostics are enabled
      expose_as_code_action = { 'fix_all', 'add_missing_imports', 'remove_unused' },
    },
  },
}
