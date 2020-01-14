let mapleader = " "
"Adde line number at begening of line
"set number
""Set mouse mode
set mouse=a
set number
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab


let g:clipboard = {
            \   'name': 'myClipboard',
            \   'copy': {
            \      '+': 'xcopy',
            \      '*': 'xcopy',
            \    },
            \   'paste': {
            \      '+': 'xcopy',
            \      '*': 'xcopy',
            \   },
            \   'cache_enabled': 1,
            \ }


" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.local/share/nvim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'Chiel92/vim-autoformat'
" CoC for autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
" windows switching
nmap <C-j> <C-w>j 
nmap <C-k> <C-w>k 
nmap <C-l> <C-w>l 
nmap <C-h> <C-w>h 
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
"
"Move line around
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nmap <F2> :tabe ~/.config/nvim/init.vim<CR>
nmap <F4> :qa<CR>
nmap <F5> :!ninja -C build<CR>
nmap gf :grep -RI "<C-r><C-w>" **/*
