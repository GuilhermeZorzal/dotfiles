syntax on 
set number relativenumber
set wrap
set linebreak
set breakindent

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=20

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch
nnoremap <CR> :noh<CR><CR>

" Set the commands to save in history default number is 20.
set history=1000

" colorscheme wildcharm 
" colorscheme lunarperche 
" colorscheme ron 
" colorscheme habamax
colorscheme sorbet 
hi Normal guibg=NONE ctermbg=NONE

" Mappings"
let mapleader = " "


nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>b :split<CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nmap <Leader>w :w!<CR>

map <S-L> :bnext<CR>
map <S-H> :bprevious<CR>

nnoremap <Leader>f :buffers<CR>:buffer

inoremap <C-BS> <C-W>

" Using lfvim as default file explorer
let lfvim = "~/.config/lf/lf.vim"
if filereadable(lfvim)
    exec "source " . lfvim
endif

nnoremap <A-Space> :LF<CR>
nnoremap <A-j> ddp
nnoremap <A-k> ddkP

autocmd VimResized * wincmd =
