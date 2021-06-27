" 行番号を表示
set number
" 検索結果ハイライト
set hlsearch
" 大文字小文字の区別をしない
set ignorecase
" インクリメンタルサーチ
set incsearch
" ステータス表示
set laststatus=2
" カーソル行表示
set cursorline
" カーソル列表示
set cursorcolumn
" ヤンクしたデータをクリップボードで使用
set clipboard+=unnamed
" オートインデント
set smartindent
" コマンドライン補完
set wildmenu
" オートコンプリート
set completeopt=menuone,noinsert
" 不可視文字可視化
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" コントロールコード
set backspace=indent,eol,start
" modifiableオン
set ma
" swap fileを作成しない
set noswapfile
" vimgrep除外ファイル
set wildignore+=node_modules/**,bin/**
" 更新時間
set updatetime=100

" Escを2回押すとハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>
" INSERTから抜ける
inoremap <silent> jj <ESC>
" カラースキーム
colorscheme iceberg
" シンタックスオン
syntax on
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
" 選択上移動
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
" 選択下移動
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>""
" 行頭へ移動
cnoremap <C-a> <Home>
inoremap <C-a> <Home>
" 行末へ移動
cnoremap <C-e> <End>
inoremap <C-e> <End>
" Exコマンドを実装する関数を定義
function! ExecExCommand(cmd)
  silent exec a:cmd
  return ''
endfunction
"インサートモードで移動
inoremap <silent> <expr> <C-p> "<C-r>=ExecExCommand('normal k')<CR>"
inoremap <silent> <expr> <C-n> "<C-r>=ExecExCommand('normal j')<CR>"
inoremap <silent> <expr> <C-f> "<C-r>=ExecExCommand('normal l')<CR>"
inoremap <silent> <expr> <C-b> "<C-r>=ExecExCommand('normal h')<CR>"
" 保存
inoremap <silent> <expr> <C-l> "<C-r>=ExecExCommand('update')<CR>"

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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

call vundle#end()
filetype plugin indent on

" Leaderキー
let mapleader = ","

" dotfile表示
let NERDTreeShowHidden=1

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_version_warning = 0
let g:netrw_altv=1

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

" Ag検索でファイル名を除外
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Format
augroup autoformat_settings
  autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
  autocmd FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd FileType go :match goErr /\<err\>/
  autocmd FileType python AutoFormatBuffer yapf
augroup END

" Terraform
let g:terraform_fmt_on_save=1
if executable('terraform-lsp')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'terraform-lsp',
    \ 'cmd': {server_info->['terraform-lsp']},
    \ 'whitelist': ['terraform','tf'],
    \ })
endif

" " Debugging
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" 
" " for asyncomplete.vim log
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
