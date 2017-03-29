" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup


" Vundle 設定(以下將列出必要的設定參數) "
set nocompatible
filetype off

" 設定執行路徑與初始化的動作 "
" 此設定可以自行指定 Vundle 實際下載位置以及未來套件安裝位置 "
" 若不照預設位置安裝，例如欲安裝路徑是 /usr/share/vim/vim74/bundle/ "
" set rtp+=/usr/share/vim/vim74/bundle/Vundle.vim/ "
" call vundle#begin('/usr/share/vim/vim74/bundle/') "
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

    " 讓 Vundle 自己管理自己，這個設定是必要的 "
    Plugin 'gmarik/Vundle.vim'

    " Plugin 放在這裡 "
    Plugin 'tpope/vim-fugitive'
    Plugin 'git://git.wincent.com/command-t.git'
    Plugin 'L9'
    Plugin 'Townk/vim-autoclose'
    Plugin 'AutoComplPop' " 自動幫你補齊的plugin
    Plugin 'Auto-Pairs'   " 括號補齊
    Plugin 'Syntastic'    " 檢查語法錯誤，目前支援大部分的主流語言(php、java等)
    Plugin 'javacomplete' " 顯示函式庫的plugin
    Plugin 'xml.vim'      " 補齊網頁的標籤
    Plugin 'Compile'      " 以後只要按下F5就可以依照不同的檔案類型去compile
    Plugin 'scrooloose/nerdtree' " 樹狀圖側欄
    Plugin 'ctrlpvim/ctrlp.vim'        " 搜尋指令  
    Plugin 'bling/vim-airline'  " 就是狀態列拉！
    Plugin 'https://github.com/c9s/colorselector.vim.git' " https://github.com/c9s/colorselector.vim 快速切換c9s做的vim主題包
    Plugin 'taglist.vim' " 在vim中輸入:Tlist，就會看到程式碼中的函式和變數
    Plugin 'Fakeclip'   "解決於 Terminal 以及 GUI 之間複製貼上的問題
    Plugin 'vimcdoc'   "vim支援中文版
    Plugin 'https://github.com/tpope/vim-surround.git'
    Plugin 'https://github.com/ap/vim-css-color.git' "顯示css色碼顏色

    " 確保所有套件加入在此指令之前 "
    call vundle#end()
    filetype plugin indent on




syntax on
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number
set cindent
set autoindent
set ruler
set ic
set cursorline
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches"
set ttymouse=xterm2

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

nnoremap <silent><F7> :NERDTree<CR>

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle/README.md')
if !filereadable(vundle_readme)
      echo "Installing Vundle.."
        echo ""
          silent !mkdir -p ~/.vim/bundle
            silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
              let iCanHazVundle=0
              endif




let g:syntastic_check_on_open = 1 

 setlocal omnifunc=javacomplete#Complete

 "compile KEY
 autocmd FileType java map <F5> :!javac "%:p" && java -cp "%:p:h" "%:t:r"<CR>
 autocmd FileType c map <F5> :!gcc --o "%:p:r.out" "%:p" && "%:p:r.out"<CR>
 autocmd FileType php noremap <F5> :w!<CR>:!/usr/bin/php %<CR>
 autocmd BufRead *.sh nmap <F5> :w !sh %<CR>

 "folding
    set foldenable 
    set foldmethod=syntax 
    set foldcolumn=0 
    nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" allows cursor change in tmux mode
 if exists('$TMUX')
 let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
 let &t_EI ="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
 else
 let &t_SI = "\<Esc>]50;CursorShape=1\x7"
 let &t_EI = "\<Esc>]50;CursorShape=0\x7"
 endif

" set status line
 set laststatus=2
" " enable powerline-fonts
 let g:airline_powerline_fonts = 1"

"nerdtree操作方式 
   "
   " ? # 進入 Help 頁面，若離開只需再一次 ?
   " o # 打開所選檔案(不會另開視窗)
   " i # 打開所選檔案，顯示內容於新的垂直分割視窗
   " s # 打開所選檔案，顯示內容於新的水平分割視窗
   " C # 將所選目錄設為根目錄
   " r # 重整目前目錄(當有新增、刪除檔案時)
   " :q # 關閉視窗
   " Ctrl + ww # 切換視窗

