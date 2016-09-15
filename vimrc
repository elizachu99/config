if &compatible
    set nocompatible
endif

" ---------- Basics ----------
syntax enable
set title
set mouse=a
set number
set background=dark
set autoindent
set copyindent
set visualbell  " don't beep
set backspace=indent,eol,start
set ignorecase
set smartcase
colorscheme torte

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab

set showmode
set showcmd
set incsearch
set scrolloff=3
set wildmode=longest,list,full
set wildmenu
set ruler

set sm
set history=100

map <S-Enter> O<Esc>
nmap <CR> o<Esc>

autocmd BufReadPre,FileReadPre * :DoJumpHl

" ----------- Quick escape ----------
imap jj <esc>
set timeout timeoutlen=200 ttimeoutlen=100

" ----------- Extras -----------
let mapleader = ','
" todo: NERDtree and jump to definition

" --------- Switch between Windows ----------
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l



