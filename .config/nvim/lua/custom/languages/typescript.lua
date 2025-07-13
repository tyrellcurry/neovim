return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      -- Disable ESLint integration to avoid conflicts with separate ESLint setup
      eslint = {
        enable = false,
      },
    },
  },
}
