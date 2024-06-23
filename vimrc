set runtimepath+=~/vimfiles

" Vimのデフォルト設定を解除し、独自設定を行う
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" ファイルエンコーディングをUTF-8に設定
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,latin1
set fileencoding=utf-8

" マウス操作を無効化
set mouse=

" 行番号を表示
set number

" 色設定 (icebergを使用するための設定)
set t_Co=256
set tabstop=4
colorscheme iceberg

" 構文強調表示とマッチングする括弧をハイライト
set showmatch
syntax enable

" 検索設定
set hlsearch
set ignorecase
set incsearch

" ステータスラインを常に表示
set laststatus=2

" インデント設定
set autoindent
set expandtab
set shiftwidth=4
set smartindent

" バックグラウンドカラーをダークに設定
set background=dark

" スワップファイルを作成しない
set noswapfile

" ノーマルモードへの移行をEscキーからjjキーに変更
imap jj <Esc>

" 括弧やクオーテーションを補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap < <><LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

inoremap { {}<LEFT>

" 隣接した{}で改行したらインデント
function! IndentBraces()
    let line = getline('.')
    let col = col('.')
    let before_char = col > 1 ? line[col - 2] : ''
    let current_char = line[col - 1]

    if before_char == '{' && current_char == '}'
        return "\<CR>\<C-o>O\<C-o>O\<C-o>==\<C-o>2k\<C-o>j\<C-o>==\<C-o>k\<C-o>l"
    elseif before_char == '(' && current_char == ')'
        return "\<CR>\<C-o>O\<C-o>O\<C-o>==\<C-o>2k\<C-o>j\<C-o>==\<C-o>k\<C-o>l"
    elseif before_char == '[' && current_char == ']'
        return "\<CR>\<C-o>O\<C-o>O\<C-o>==\<C-o>2k\<C-o>j\<C-o>==\<C-o>k\<C-o>l"
    else
        return "\<CR>"
    endif
endfunction

inoremap <silent> <expr> <CR> IndentBraces()



" プラグインの読み込み
packadd! vim-airline
packadd! vim-airline-themes
packadd! nerdtree
packadd! lexima.vim

" vim-airlineの設定
let g:airline_theme = 'bubblegum'               " テーマの指定
let g:airline#extensions#tabline#enabled = 1    " タブラインを表示

" タブの切り替えをCtrl+nとCtrl+pで行う設定
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" スワップファイル、バックアップファイル、undoファイルの作成を無効化
set noswapfile
set nobackup
set noundofile

" NERDTreeのキーバインド設定
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Vim起動時にNERDTreeを開き、NERDTreeウィンドウにフォーカスを設定
autocmd VimEnter * NERDTree

" NERDTreeが唯一のウィンドウである場合、Vimを終了
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
