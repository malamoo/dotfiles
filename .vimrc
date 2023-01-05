call plug#begin()

Plug 'sainnhe/everforest' " colorscheme
Plug 'ourigen/skyline.vim' " minimal status line
Plug 'ap/vim-buftabline' " manage buffers as if they were tabs
Plug 'tpope/vim-sensible' " sensible defaults for vim
Plug 'romainl/vim-qf' " improve location and quickfix windows

call plug#end()

" enable project specific .vimrc
set exrc
set secure

" show commands on screen
set showcmd

" always put split windows to right and below
set splitright
set splitbelow

" enable line numbers
set number

" configure indent
set tabstop=4
set shiftwidth=4
set expandtab

" highlight all search matches
set hlsearch

" color columns past max text width
let &colorcolumn="79,".join(range(80,999),",")
set textwidth=80

" configure colorscheme
set background=dark
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1
colorscheme everforest

" edit vimrc
nn <silent> <Leader>ev :edit $MYVIMRC<CR>

" save buffer
nn <Leader>s :w<CR>

" close buffer
nn <Leader>bd :bd<CR>

" get shift-tab to work
set t_kB=[Z

" tab to switch to next open buffer
nn <silent> <Tab> :bnext<CR>
nn <silent> <S-Tab> :bprev<CR>
