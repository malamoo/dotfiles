call plug#begin()

Plug 'sainnhe/everforest'
Plug 'ourigen/skyline.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-sensible'
Plug 'romainl/vim-qf'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rhysd/vim-clang-format'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plug 'itspriddle/vim-shellcheck'
Plug 'mileszs/ack.vim'

call plug#end()

" enable project specific .vimrc
set exrc
set secure

" enable line numbers
set number

" configure indent
set tabstop=4
set shiftwidth=4
set expandtab

" highlight all search matches
set hlsearch

" toggle search highlight
nnoremap <Leader><Space> :set hlsearch! hlsearch?<CR>

" color columns past max text width
let &colorcolumn="79,".join(range(80,999),",")
set textwidth=80

" strip whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" configure everforest colorscheme
colorscheme everforest
set background=dark
let g:everforest_background = 'soft'

" configure skyline
let g:skyline_wordcount = 1

" configure clang format
autocmd FileType c ClangFormatAutoEnable

" configure shfmt
let g:shfmt_extra_args = '-i 4'
let g:shfmt_fmt_on_save = 1

" configure shellcheck
augroup filetypedetect
    au! BufWritePre *.sh ShellCheck! -x
augroup END

" configure ack to use ag
let g:ackprg = 'ag --vimgrep'

" save buffer
nnoremap <Leader>s :w<CR>

" replace word under cursor
nnoremap <Leader>* :%s/\<<C-R><C-W>\>//gc<Left><Left><Left>

" search for visual selection
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

" move lines
nnoremap <Leader>k :m-2<CR>==
nnoremap <Leader>j :m+<CR>==
xnoremap <Leader>k :m-2<CR>gv=gv
xnoremap <Leader>j :m'>+<CR>gv=gv

" create a new buffer
nnoremap <Leader>B :enew<CR>

" close current buffer
nnoremap <Leader>bq :bp <Bar> bd! #<CR>

" close all open buffers
nnoremap <Leader>ba :bufdo bd!<CR>

" tab to switch to next open buffer
nnoremap <Tab> :bnext<CR>
nnoremap <Leader><Tab> :bprev<CR>

" leader key twice to cycle between two open buffers
nnoremap <Leader><Leader> <C-^>
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

" f3 to find file in path
nnoremap <F3> :find<Space>

" find occurrences of pattern in path
nnoremap <Leader>a :silent Ack!<Space><C-R><C-W><CR>

" move to/create windows
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" recognize *.h filetype as C
augroup filetypedetect
    au! BufRead,BufNewFile *.h setfiletype c
augroup END

" enable auto completion menu after pressing tab
set wildmenu

" there are certain files that we would never want to edit with Vim
" wildmenu will ignore files with these extensions
set wildignore=*.jpg,*.png,*.gif,*.pdf,*.o,*.d
