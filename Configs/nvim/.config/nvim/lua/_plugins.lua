-- This file can be loaded by calling `lua require('_plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --
  -- Editor enhancements
  --

  -- which key: key binding hints
  use 'folke/which-key.nvim'

  -- fonts and icons
  use 'ryanoasis/vim-devicons'
  use "nvim-tree/nvim-web-devicons"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- easy align (gai<space>)
  use 'junegunn/vim-easy-align'

  -- fzf fuzzy file search/navigation
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  --
  -- telscope
  --
  use 'nvim-telescope/telescope.nvim'

  -- telscope plugins/extensions
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "nvim-telescope/telescope-frecency.nvim" }
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'nvim-telescope/telescope.nvim'},
    },
  }
  use {
    'LukasPietzschmann/telescope-tabs',
    requires = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require'telescope-tabs'.setup{
      }
    end
  }

  use "jmacadie/telescope-hierarchy.nvim"

  -- fern: file navigator
  use 'lambdalisue/vim-fern'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/vim-fern-git-status'
  use 'lambdalisue/vim-fern-hijack'
  use 'lambdalisue/vim-fern-renderer-nerdfont'
  use 'LumaKernel/fern-mapping-fzf.vim'
  use 'yuki-yano/fern-preview.vim'

  --
  -- LSP
  --
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'prabirshrestha/vim-lsp'
  use 'prabirshrestha/async.vim'
  use 'prabirshrestha/asyncomplete.vim'
  use 'prabirshrestha/asyncomplete-lsp.vim'
  use {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  }

  -- screenshots
  -- use "AlejandroSuero/freeze-code.nvim"

  -- git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  --
  -- theme
  --
  use "scottmckendry/cyberdream.nvim"

  --
  -- file-type specific
  --

  -- golang
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'
  use 'mfussenegger/nvim-dap'
  use 'nvim-neotest/nvim-nio'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

  -- python
  -- all lsps now

  -- justfiles
  use 'NoahTheDuke/vim-just'

  -- terraform
  use 'hashivim/vim-terraform'

  -- prettier
  use 'prettier/vim-prettier'

  -- formatter
  use 'sbdchd/neoformat'

  -- comments
  use 'tpope/vim-commentary'

  -- lua
  use 'nvim-lua/plenary.nvim'

  -- helm
  use 'towolf/vim-helm'

  -- nvim gui components
  use 'MunifTanjim/nui.nvim'

  --
  -- Generative AI
  --
  --
  use 'stevearc/dressing.nvim'
  use 'MeanderingProgrammer/render-markdown.nvim'

  use {
    'yetone/avante.nvim',
    branch = 'main',
    run = 'make',
    config = function()
      require('avante').setup(
        {
          opts = {
            providers = {
              claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-sonnet-4-20250514",
                -- model = "claude-opus-4-20250514",
                timeout = 30000, -- Timeout in milliseconds
                disable_tools = true, -- disable tools!
                extra_request_body = {
                  temperature = 0,
                  max_tokens = 4096,
                }
              }
            }
          }
        }
      )
    end
  }

end)
