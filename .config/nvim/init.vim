lua require('_plugins')
lua require('telescope_init')
lua require('treesitter_init')
lua require('evil_lualine')
lua require('config.autocmds')
lua require('golang')
lua require('lsp')
lua require('cyberdream')
" lua require('screenshots')
lua require('guihua')
lua require('init')

"""
""" Global Settings
"""
" set number
set number relativenumber
" set loaded_netrw = 1
" set loaded_netrwPlugin = 1

" Clipboard
set clipboard=unnamedplus

" fold
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
autocmd FileType json setlocal foldmethod=syntax

" leader: follow the leader
let mapleader = ","
let g:mapleader = ","

" file explorer commands
" nnoremap <C-p> :GFiles .<CR>
" nnoremap <C-f> :Files .<CR>
" nnoremap <buffer> <leader>* :Ag  <c-r>=expand("<cword>")<cr><CR>


"
" fern settings
"
nnoremap <C-b> :Fern . -drawer<CR>
nnoremap <C-N> :Fern . -reveal=%<CR>
let g:fern#renderer = "nerdfont"

function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

function! s:fern_settings() abort
  nmap <silent> <buffer> <expr> <Plug>(fern-quit-or-close-preview) fern_preview#smart_preview("\<Plug>(fern-action-preview:close)", ":q\<CR>")
  nmap <silent> <buffer> q <Plug>(fern-quit-or-close-preview)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END


"
" Telescope
"
" file find/nav
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope frecency workspace=CWD<cr>
" lsp
nnoremap <leader>gd <cmd>Telescope lsp_definitions<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>gi <cmd>Telescope lsp_implementations<cr>
nnoremap <leader>gr <cmd>Telescope lsp_references<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gy <cmd>Telescope lsp_type_definitions<cr>
nnoremap <leader>ghi <cmd>Telescope hierarchy incoming_calls<cr>
nnoremap <leader>gho <cmd>Telescope hierarchy outgoing_calls<cr>
" clipboard and tabs
nnoremap <leader>nc <cmd>Telescope neoclip<cr>
nnoremap <leader>tt <cmd>Telescope telescope-tabs list_tabs theme=cursor<cr>


"
" Render Markdown
"
nnoremap <leader>rd <cmd>:RenderMarkdown disable<cr>
nnoremap <leader>re <cmd>:RenderMarkdown enable<cr>

" LSP: standalones
" most commands are run w/ telescope but there are a few we want to keep
" available w/out <leader>
nnoremap <leader>gD :tab lsp_definition<cr>
autocmd FileType go nmap <buffer> gD :tab LspDefinition<cr>
autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
nnoremap <leader>gD :tab LspDefinition<cr>


"""
"""
"""
autocmd BufNewFile,BufRead *.service* set ft=systemd

"""
""" terraform
"""
autocmd BufWritePre *.tf TerraformFmt

"""
""" Go Settings
"""
" also see lua/golang.lua
autocmd FileType go setlocal shiftwidth=4 tabstop=4
augroup LspGo
  au!
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'gopls',
      \ 'cmd': {server_info->['gopls']},
      \ 'whitelist': ['go'],
      \ })
  autocmd FileType go setlocal omnifunc=lsp#complete
  autocmd FileType go nmap <tab> gD <plug>(lsp-definition)
  autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
  autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
  autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
augroup END


"""
""" Python Settings
"""
augroup LspPython
  " let g:python3_host_prog = '/usr/local/bin/python3'
  " let g:vim_isort_python_version = 'python3'
  " let g:syntastic_python_checkers=['flake8']
  aug python
      au!
      autocmd BufWritePre *.py Neoformat ruff
  aug END
  "
  let g:jedi#use_tabs_not_buffers = 1
  let g:jedi#goto_command = "<leader>d"
  let g:jedi#goto_assignments_command = "<leader>g"
  let g:jedi#goto_stubs_command = "<leader>s"
  let g:jedi#goto_definitions_command = ""
  let g:jedi#documentation_command = "K"
  let g:jedi#usages_command = "<leader>n"
  let g:jedi#completions_command = "<C-Space>"
  let g:jedi#rename_command = "<leader>r"
  let g:jedi#rename_command_keep_name = "<leader>R"
augroup END



"""
""" Easy Align
"""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"""
""" Javascript settings
"""

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2


let g:neoformat_try_formatprg = 1
let g:jsx_ext_required = 0

" max line length that prettier will wrap on
let g:prettier#config#print_width = 100
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'
" let g:prettier#config#jsx_bracket_same_line = 'true'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#parser = 'flow'
let g:prettier#config#config_precedence = 'prefer-file'

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.mdx,*.tcss Prettier

"""
""" Whitespace Settings
"""

" default
set tabstop=2 shiftwidth=2 expandtab

" Trim whitespace on save
function TrimWhiteSpace()
    %s/\s*$//
    ''
:endfunction

set list listchars=tab:>-,trail:·
" set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()
map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>
