" Enable modern Vim features not compatible with Vi spec.
set nocompatible

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)

" Enable Pathogen
execute pathogen#infect()

filetype plugin indent on
syntax enable

" Basics
set title
set mouse=a
set number
set autoindent
set backspace=indent,eol,start

" Colorscheme
colorscheme ron
"colorscheme elflord

" Tab configurations
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab

" More basics
let mapleader = ' '
set showmode
set showcmd
set ignorecase
set smartcase
set incsearch
set scrolloff=3
set sm
set history=100
set wildmode=longest,list,full
set wildmenu

" Highlighting
set colorcolumn=+1  " vertical bar indicating where textwidth column is
highlight ColorColumn ctermbg=gray guibg=gray9
"autocmd WinEnter * setlocal cursorline
"autocmd BufEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline
setlocal cursorline
hi StatusLine ctermfg=33
set laststatus=2
hi LineNr term=bold cterm=NONE ctermfg=GREY ctermbg=NONE gui=NONE
"guifg=DarkGrey guibg=NONE
"autocmd BufReadPre,FileReadPre * :DoJumpHl

" Easy exit of insert mode is crucial!
imap jj <esc>
set timeout timeoutlen=200 ttimeoutlen=100

" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz

" Search - scroll to middle if not on current page
nnoremap <silent> n n:call <SID>MaybeMiddle()<CR>
nnoremap <silent> N N:call <SID>MaybeMiddle()<CR>
function s:MaybeMiddle()
  if winline() <= 3  || winheight(0) - winline() <= 3
      normal! zz
  endif
endfunction

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Navigating ctags
set tags=./tags;$HOME
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Buffer navigation
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <C-c> :bp\|bd #<CR>

" Other convenient key mappings
nnoremap <C-V> <c-v>

" NERDTree
nnoremap <leader>f :NERDTreeToggle<Enter>
"" Close tab if only remaining window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
