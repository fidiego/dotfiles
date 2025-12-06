vim.lsp.config.inlay_hints = {
  enabled = true
}
vim.lsp.config.codelens = {
  enabled = true
}

vim.lsp.enable('taplo')
-- vim.lsp.config.gopls.setup({})
vim.lsp.enable('ts_ls')
vim.lsp.enable('terraformls')
vim.lsp.enable('tflint')
-- vim.lsp.config.jedi_language_server.setup({})
vim.lsp.enable('lua_ls')
vim.lsp.enable('helm_ls')
vim.lsp.enable('bashls')

-- python: configure and enable
vim.lsp.config('pyright', {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
})

vim.lsp.config('ruff', {
  init_options = {
    settings = {
      logLevel = 'debug',
    }
  },
})

vim.lsp.enable('pyright')
vim.lsp.enable('ruff')

-- vim.lsp.enable("nuon")
-- vim.lsp.start({
--   name = "nuon",
--   cmd = { "/Users/fd/.local/bin/nuon-lsp" },  -- Update with your actual path
--   root_dir = vim.fn.getcwd()
-- })
