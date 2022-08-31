call plug#begin()

Plug 'tpope/vim-surround' " https://vimawesome.com/plugin/surround-vim
Plug 'airblade/vim-gitgutter' " https://vimawesome.com/plugin/vim-gitgutter
Plug 'arcticicestudio/nord-vim' " https://vimawesome.com/plugin/nord-vim
Plug 'vim-airline/vim-airline' " https://vimawesome.com/plugin/vim-airline-superman
Plug 'tpope/vim-commentary' " https://vimawesome.com/plugin/commentary-vim
Plug 'scrooloose/nerdtree' " https://vimawesome.com/plugin/nerdtree-red
Plug 'ervandew/supertab' " https://vimawesome.com/plugin/supertab

" https://vimawesome.com/plugin/fzf-vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" color scheme
set termguicolors
colorscheme nord

" Correct RGB escape codes for vim inside tmux
if !has('nvim') && $TERM ==# 'screen-256color'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" global config
set relativenumber
let mapleader = ","
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set incsearch
set ignorecase
set smartcase
set nobackup
set noswapfile
set wildignore+=*.map,*.gz,.git,node_modules
set splitbelow
set splitright
set history=1000              " Number of commands and search queries to remember
set undofile                  " Save undo history across sessions
set undolevels=1000           " Number of undo levels to store
set undodir=~/.vim/.undo   " Where to store the undo file
set spelllang=ru,en
set list " show empty chars
set listchars=tab:>-,trail:~,extends:>,precedes:<
set fixendofline
set ruler
set colorcolumn=100

autocmd BufWritePre * %s/\s\+$//e " automatically remove empty chars in the end of liue

autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal wrap linebreak spell

" Don't show cursor line when we are in insert mode, show it otherwise
autocmd WinLeave,InsertEnter * set nocursorline
autocmd WinEnter,InsertLeave * set cursorline

noremap ff ^
noremap F $

cnoremap <expr> %% expand('%:h').'/'

imap bp<Tab> binding.pry<ESC>
imap log<tab> console.log()<Left>

map <S-Up> 10gk
map <S-Down> 10gj

nmap <Leader>[ :bprevious<CR>
nmap <Leader>] :bnext<CR>

" fzf
if isdirectory(".git")
  map <silent><Leader>p :GFiles<CR>
else
  map <silent><Leader>p :Files<CR>
endif
map <silent><Leader>P :Buffers<CR>
map <silent><Leader>h :History<CR>

" NERDTree
nnoremap <silent><Leader>b :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
