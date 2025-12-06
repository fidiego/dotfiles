-- Nuon-inspired color palette for nvim
-- Based on $NUON_ROOT/pkg/cli/styles/colors.go (dark theme)

local M = {}

-- Primary palette (from Nuon CLI)
M.primary     = '#D6B0FC'  -- darkPrimaryColor
M.secondary   = '#99B7FF'  -- darkSecondaryColor
M.accent      = '#8040BF'  -- darkAccentColor
M.text        = '#FFFFFF'  -- darkTextColor
M.subtle      = '#B9B9B9'  -- darkSubtleColor
M.success     = '#5BBFB5'  -- darkSuccessColor
M.warning     = '#FFBD7F'  -- darkWarningColor
M.error       = '#FF8383'  -- darkErrorColor
M.info        = '#527FE8'  -- darkInfoColor
M.bg          = '#1B242C'  -- darkPrimaryBGColor
M.border      = '#4F4F4F'  -- darkBorderInactiveColor

-- Aliases for compatibility with evil_lualine
M.fg       = M.text
M.yellow   = M.warning
M.cyan     = '#008080'
M.darkblue = '#081633'
M.green    = M.success
M.orange   = '#FF8800'
M.violet   = M.primary
M.magenta  = M.accent
M.blue     = M.secondary
M.red      = M.error

return M
