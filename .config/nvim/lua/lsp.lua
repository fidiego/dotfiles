local lspconfig = require("lspconfig")

lspconfig.inlay_hints = {
  enabled = true
}
lspconfig.codelens = {
  enabled = true
}

lspconfig.taplo.setup({})
lspconfig.gopls.setup({})
lspconfig.ts_ls.setup({})
lspconfig.terraformls.setup({})
lspconfig.tflint.setup({})
lspconfig.jedi_language_server.setup{}
lspconfig.lua_ls.setup({})
lspconfig.helm_ls.setup({})
lspconfig.bashls.setup({})
