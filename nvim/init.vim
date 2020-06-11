let mapleader = " "
set autowrite
"Adde line number at begening of line
"set number
""Set mouse mode
set mouse=a
set number
"Casing on search. smarcase ignore case unless capital letter are explicitly
"searched 
set ignorecase
set smartcase 

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set foldmethod=syntax
set foldlevelstart=99
"Setup clipboard for wsl
if has('wsl')
    augroup Yank
        autocmd!
        autocmd TextYankPost * :call system('clip.exe ',@")
    augroup END
endif
map <leader>y "*y

" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.local/share/nvim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
"Toggle to relativenumber on normal mode, and absolute in insert mode 
Plug 'jeffkreeftmeijer/vim-numbertoggle'
set number relativenumber
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'Chiel92/vim-autoformat'
Plug 'vim-airline/vim-airline'
" CoC for autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :FZF<CR>

Plug 'jremmen/vim-ripgrep'
"This use RipGrep to search the whole current directory (search under cursor)
nnoremap <leader>g :Rg<CR>
let g:rg_highlight = 1

" Themes
Plug 'mhartington/oceanic-next'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Themes 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if (has("termguicolors"))
    set termguicolors
endif
"Theme
syntax enable
colorscheme gruvbox
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Coc Setup + map
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jj <Esc>
let g:coc_global_extensions = ['coc-json', 'coc-python']
"Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
" Insert mode remaps
"current word to upper letter
inoremap <C-u> <esc>viwUea
" Move in window 
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
" windows switching
nmap <A-j> <C-w>j 
nmap <A-k> <C-w>k 
nmap <A-l> <C-w>l 
nmap <A-h> <C-w>h 
nnoremap <silent> <A-Right> <C-w>l
nnoremap <silent> <A-Left> <C-w>h
nnoremap <silent> <A-Up> <C-w>k
nnoremap <silent> <A-Down> <C-w>j
"Move in change list
nnoremap <leader><Down> :cnext<CR>zz
nnoremap <leader><Up> :previous<CR>zz

nmap <F2> :tabe ~/.config/nvim/init.vim<CR>
nmap <F4> :qa<CR>
nmap <leader><F4> :qa!<CR>
nmap <F5> :!ninja -C build<CR>
nmap gf :grep -RI "<C-r><C-w>" **/*
