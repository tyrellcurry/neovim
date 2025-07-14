-- Diagnostic configuration for LSP and other diagnostic providers

-- Configure diagnostics
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '⚠',
      [vim.diagnostic.severity.INFO] = 'ℹ',
      [vim.diagnostic.severity.HINT] = '💡',
    },
  },
  severity_sort = true,
  virtual_text = {
    spacing = 4,
    source = false,
    -- Disable highlight groups for virtual text
    hl_mode = 'combine',
    format = function(diagnostic)
      -- Get all diagnostics for the current line
      local line = diagnostic.lnum
      local bufnr = diagnostic.bufnr or vim.api.nvim_get_current_buf()
      local line_diagnostics = vim.diagnostic.get(bufnr, { lnum = line })
      
      -- If there are multiple diagnostics on this line, only show the most severe one
      if #line_diagnostics > 1 then
        -- Sort by severity (ERROR=1, WARN=2, INFO=3, HINT=4)
        table.sort(line_diagnostics, function(a, b)
          return a.severity < b.severity
        end)
        
        -- Only show this diagnostic if it's the most severe one
        if diagnostic.severity ~= line_diagnostics[1].severity then
          return '' -- Don't show this diagnostic
        end
      end
      
      -- Show the emoji and clean message for the most severe diagnostic
      local icons = {
        [vim.diagnostic.severity.ERROR] = '🔥',     
        [vim.diagnostic.severity.WARN] = '👀',     
        [vim.diagnostic.severity.INFO] = '💡',    
        [vim.diagnostic.severity.HINT] = '🌈',   
      }
      local icon = icons[diagnostic.severity] or '●'
      
      -- Clean the message by removing source prefixes and error codes
      local message = diagnostic.message
      -- Remove common prefixes like "ts:", "eslint:", etc.
      message = message:gsub('^[%w%-]+:%s*', '')
      -- Remove error codes in brackets like [1155], [7005], etc.
      message = message:gsub('%s*%[%w%-]+%]%s*$', '')
      
      return string.format('%s %s', icon, message)
    end,
  },
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}

-- Return empty table since this is just configuration
return {} 