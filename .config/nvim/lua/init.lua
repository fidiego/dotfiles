require('gitsigns').setup()

-- bufferline
vim.opt.termguicolors = true


--
-- Colors
--

-- Sets colors to line numbers Above, Current, and Below
function LineNumberColors()
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#21D375', bold=false })
  vim.api.nvim_set_hl(0, 'LineNr', { fg='#ffffff', bold=true })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#cc7722', bold=false })
end

-- Set Tab colors
function TabLineColors()
  -- vim.api.nvim_set_hl(0, 'TabLine', { fg="DarkBlue",  bg="Gray" })
  vim.api.nvim_set_hl(0, 'TabLine',     {fg='DarkBlue', bg='Gray'})
  vim.api.nvim_set_hl(0, 'TabLineSel',  {fg='Blue', bg='Yellow'})
  vim.api.nvim_set_hl(0, 'TabLineFill', {fg='LightBlue', bg='DarkBlue'})
  vim.api.nvim_set_hl(0, 'TabLineSeparatorSel', {fg='LightBlue', bg='DarkBlue'})

end

-- cursor
vim.opt.cursorline = true -- Ensure the cursorline is enabled
-- function CursorColors()
--   vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='#1e1e2e', bold=true })
--   vim.api.nvim_set_hl(0, 'Cursor', { fg='#2cff05', bold=true })
-- end

LineNumberColors()
TabLineColors()
-- CursorColors()
