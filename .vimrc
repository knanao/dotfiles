" display line number.
set number
" highlight serch result.
set hlsearch
" not case sensitive.
set ignorecase
" incremental search.
set incsearch
" display status.
set laststatus=2
" display cursor line.
set cursorline
" display cursor column.
set cursorcolumn
" use yanked data on the clipboard.
set clipboard+=unnamed
" auto indent.
set smartindent
" command line completion.
set wildmenu
" auto completion.
set completeopt=menuone,noinsert
" invisible character visualization.
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" control code.
set backspace=indent,eol,start
" modifiable on.
set ma
" no swap file.
set noswapfile
" ignore file with vimgrep.
set wildignore+=node_modules/**,bin/**
" update time.
set updatetime=100

" press Esc twice to turn off the highlights.
nnoremap <Esc><Esc> :nohlsearch<CR>
" escape INSERT mode.
inoremap <silent> jj <ESC>
" color scheme.
colorscheme iceberg
" syntax on.
syntax on
" do not start a new line with Enter when displaying completion.
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
" move up.
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
" move down.
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>""
" move top.
cnoremap <C-a> <Home>
inoremap <C-a> <Home>
" move end.
cnoremap <C-e> <End>
inoremap <C-e> <End>
" define a function that implements the exec command.
function! ExecExCommand(cmd)
  silent exec a:cmd
  return ''
endfunction
" move in insert mode.
inoremap <silent> <expr> <C-p> "<C-r>=ExecExCommand('normal k')<CR>"
inoremap <silent> <expr> <C-n> "<C-r>=ExecExCommand('normal j')<CR>"
inoremap <silent> <expr> <C-f> "<C-r>=ExecExCommand('normal l')<CR>"
inoremap <silent> <expr> <C-b> "<C-r>=ExecExCommand('normal h')<CR>"
" update.
inoremap <silent> <expr> <C-l> "<C-r>=ExecExCommand('update')<CR>"

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Terminal model
" set termwinkey=<C-a>
" nnoremap <C-t> :tab ter<CR>

Plugin 'VundleVim/Vundle.vim'

" Plugin
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'mattn/vim-goimports'
Plugin 'mattn/vim-lsp-icons'
Plugin 'mattn/emmet-vim'
Plugin 'preservim/nerdtree'
Plugin 'cohama/lexima.vim'
Plugin 'simeji/winresizer'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'hashivim/vim-terraform' , { 'for': 'terraform'}
Plugin 'prettier/vim-prettier', { 'for': ['javascript', 'typescript', 'css', 'scss', 'html']}
Plugin 'knanao/godoc'
Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on

" leader key.
let mapleader = ","

" display dotfile.
let NERDTreeShowHidden = 1

" split on the right
let g:netrw_altv = 1

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_version_warning = 0

" Rust
let g:rustfmt_autosave = 1

" Terraform
let g:terraform_fmt_on_save = 1

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_config_files = ['.prettierrc.json', '.prettierrc']
let g:prettier#config#config_precedence = 'prefer-file'

" LSP
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0
let g:lsp_highlight_references_enabled = 1

nnoremap <silent> <f2> :LspRename<CR>
nnoremap <silent> <Leader>d :LspPeekDefinition<CR>
nnoremap <silent> <Leader>r :LspReferences<CR>
nnoremap <silent> <Leader>t :LspHover<CR>
nnoremap <silent> <Leader>b :NERDTreeFind<CR>
nnoremap <silent> <C-]> :LspDefinition<CR>
nnoremap <silent> <C-i> :LspCallHierarchyIncoming<CR>
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Ag<CR>
nnoremap <silent> <C-g> :GFiles?<CR>
nnoremap <silent> <C-h> :History:<CR>

" ignore the file with Ag search.
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Format
augroup autoformat_settings
  " autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
  autocmd FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd FileType go :match goErr /\<err\>/
  autocmd FileType python AutoFormatBuffer yapf
augroup END

" Debugging
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" 
" for asyncomplete.vim log
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
