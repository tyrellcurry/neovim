return {
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      update_interval = 3000,
      fallback = 'dark',
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
        require('plugins.editor.lualine-theme').apply_highlights()
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        require('plugins.editor.lualine-theme').apply_highlights()
      end,
    },
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        transparent = true,
        styles = {
          comments = { italic = true },
          sidebars = 'transparent',
          floats = 'transparent',
        },
      }

      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
