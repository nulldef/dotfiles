call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'terryma/vim-multiple-cursors'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components'
Plug 'ajh17/spacegray.vim'
Plug 'scrooloose/nerdtree'
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'

call plug#end()

" global config
set number
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
set wildignore+=*.map,*.gz,.git
set splitbelow
set splitright
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set cursorline

nnoremap <Leader><Left> <C-W>h
nnoremap <Leader><Up> <C-W>j
nnoremap <Leader><Down> <C-W>k
nnoremap <Leader><Right> <C-W>l
nnoremap $ g_
noremap ff ^
map fx :ALEFix<CR>
map qq :bd<CR>
imap jj <Esc>
cnoremap <expr> %% expand('%:h').'/'

" Vim-test
map <Leader>t :TestFile<CR>
map <Leader>n :TestNearest<CR>

" Emmet
let g:user_emmet_leader_key='<C-E>'

" JS
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" JSX
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

" Spacegray
let g:spacegray_underline_search = 1
let g:spacegray_use_italics = 1
colorscheme spacegray

" Nerd tree
map <Leader>b :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>

" Ale
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'ruby': ['rubocop'],
\}

" CtrlP
let g:ctrlp_user_command = 'cd %s && git ls-files -co --exclude-standard'
map <Leader>p :CtrlP<CR>
