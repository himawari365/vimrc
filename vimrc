unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
set fileencoding=utf-8
set number
" これ書かないとicebergが使えない
set t_Co=256
set tabstop=4
colorscheme iceberg
set showmatch
set shiftwidth=4
syntax enable
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set autoindent
set expandtab
set background=dark
set smartindent
set noswapfile
" ノーマルモードへの移行をEscキーからjjキーに変更する
imap jj <Esc>
packadd! vim-airline
packadd! vim-airline-themes
packadd! nerdtree
let g:airline_theme = 'bubblegum'               " テーマの指定
let g:airline#extensions#tabline#enabled = 1 " タブラインを表示

" Ctrl n,pでタブの切り替えを可能にする
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
" swpファイル出力無効
set noswapfile
" バックアップファイル出力無効
set nobackup
" undoファイル出力無効
set noundofile

" execute pathgen#infect()
" syntax on
" filetype plugin indent on

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" test