require("freeze-code").setup({
  freeze_path = vim.fn.exepath("freeze"), -- where is freeze installed
  freeze_config = { -- configuration options for `freeze` command
    output = "freeze",
    config = "user",
    theme = "default",
    show_line_numbers = true
  },
})
