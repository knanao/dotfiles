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
" ヤンクしたデータをクリップボードで使用
set clipboard+=unnamed
" オートインデント
set smartindent
" コマンドライン補完
set wildmenu
" オートコンプリート
set completeopt=menuone,noinsert

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
inoremap <silent> <expr> <C-p> "<C-r>=ExecExCommand('normal k')<CR>"
inoremap <silent> <expr> <C-n> "<C-r>=ExecExCommand('normal j')<CR>"
" 補完せず補完ウィンドウを閉じてから移動
inoremap <silent> <expr> <C-b> pumvisible() ? "<C-e><C-r>=ExecExCommand('normal b')<CR>" : "<C-r>=ExecExCommand('normal b')<CR>"
inoremap <silent> <expr> <C-f> pumvisible() ? "<C-e><C-r>=ExecExCommand('normal w')<CR>" : "<C-r>=ExecExCommand('normal w')<CR>"
" 保存
inoremap <silent> <expr> <C-l> "<C-r>=ExecExCommand('update')<CR>"

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugin
Plugin 'ctrlp.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'mattn/vim-goimports'
Plugin 'mattn/vim-lsp-icons'
Plugin 'preservim/nerdtree'
Plugin 'cohama/lexima.vim'

call vundle#end()
filetype plugin indent on

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_version_warning = 0
let g:netrw_altv=1

autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
autocmd BufWritePre <buffer> LspDocumentFormatSync

" LSP
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0

nmap <silent> gd :LspDefinition<CR>
nmap <silent> <f2> :LspRename<CR>
nmap <silent> <Leader>d :LspTypeDefinition<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>

nnoremap <silent> <C-]> :LspDefinition<CR>
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

