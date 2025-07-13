return {
  'andrewferrier/wrapping.nvim',
  config = function()
    require('wrapping').setup {
      -- Enable soft wrapping for all filetypes
      auto_set_mode_heuristically = true,
      -- Set default mode to soft wrap
      create_keymaps = true,
      create_commands = true,
      -- Notify when mode changes (optional, can be annoying)
      notify_on_switch = false,
    }

    -- Force soft wrap mode for all buffers
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
      pattern = '*',
      callback = function()
        require('wrapping').soft_wrap_mode()
      end,
    })
  end,
}
