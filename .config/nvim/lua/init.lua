require('gitsigns').setup()

-- bufferline
vim.opt.termguicolors = true

-- Sets colors to line numbers Above, Current and Below  in tvim.api.nvim_set_hi(0, s order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#21D375', bold=false })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#ffffff', bold=true })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='#ffffff', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#CC7722', bold=false })
end
LineNumberColors()

-- -- Set Tab colors
-- function TabLineColors()
--   vim.api.nvim_set_hl(0,  'TabLine',     {fg='DarkBlue', bg='Gray', guifg='DarkBlue', guibg='Gray', ctermfg='DarkBlue', ctermbg='Gray'})
--   vim.api.nvim_set_hl(0,  'TabLineSel',  {guifg='Blue', guibg='Yellow', ctermfg='Blue', ctermbg='Yellow'})
--   vim.api.nvim_set_hl(0,  'TabLineFill', {guifg='LightBlue', guibg='DarkBlue', ctermfg='LightBlue', ctermbg='DarkBlue'})
-- end
-- TabLineColors()
