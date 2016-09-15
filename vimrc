syntax enable
set title
set mouse=a
set number
set background=dark
set autoindent
set backspace=indent,eol,start
colorscheme torte
"colorscheme desert
"colorscheme elflord
"elflord commented out because doesn't color 'for', 'if' in Python
"desert commented out because colors too bland for Python (3 colors mostly)

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab

set showmode
set showcmd
set ignorecase
set smartcase
set incsearch
set scrolloff=3

imap jj <esc>
set timeout timeoutlen=200 ttimeoutlen=100

set sm
set history=100


map <S-Enter> O<Esc>
nmap <CR> o<Esc>

autocmd BufReadPre,FileReadPre * :DoJumpHl

set wildmode=longest,list,full
set wildmenu

