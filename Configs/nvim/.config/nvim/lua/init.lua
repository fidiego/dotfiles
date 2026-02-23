require('gitsigns').setup()

local colors = require('colors')

vim.opt.termguicolors = true
vim.opt.cursorline = true

-- Line number colors (cool up, warm down)
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = colors.success })  -- teal #5BBFB5
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.text, bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = colors.error })    -- red #FF8383

-- Tab colors (Nuon-themed)
vim.api.nvim_set_hl(0, 'TabLine', { fg = colors.subtle, bg = colors.bg })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = colors.text, bg = colors.accent, bold = true })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = colors.bg })
