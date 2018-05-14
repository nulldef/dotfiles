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
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'slim-template/vim-slim'
Plug 'chr4/nginx.vim'
Plug 'roman/golden-ratio'

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
set ttyfast                   " Claim we have a fast terminal<Paste>
set ttimeout                  " Time out on keycodes
set ttimeoutlen=0             " Process keycodes immediately
set nolazyredraw              " Disable lazy redraw, this causes issues in terminal
set autoread                  " Autoread the file when changed from the outside
set autowriteall              " Autowrite file on certain events, line :next, :make, etc.
set history=1000              " Number of commands and search queries to remember
set undofile                  " Save undo history across sessions
set undolevels=1000           " Number of undo levels to store
set undodir=~/.dotfiles/vim/.undo   " Where to store the undo file
set spelllang=ru,en
set list

autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal wrap linebreak spell

" Don't show cursor line when we are in insert mode, show it otherwise
autocmd WinLeave,InsertEnter * set nocursorline
autocmd WinEnter,InsertLeave * set cursorline

au BufWritePost *.js,*.rb silent! !ctags 2> /dev/null &

nnoremap <Leader><Left> <C-W>h
nnoremap <Leader><Up> <C-W>j
nnoremap <Leader><Down> <C-W>k
nnoremap <Leader><Right> <C-W>l
nnoremap $ g_
noremap ff ^
map fx :ALEFix<CR>
noremap F $
map qq :bd<CR>
imap jj <Esc>
cnoremap <expr> %% expand('%:h').'/'
nmap <Leader>] :bn<CR>
nmap <Leader>[ :bp<CR>
imap bp binding.pry<ESC>
imap log<tab> console.log()<Left>
nmap <S-Up> 10gk
nmap <S-Down> 10gj

" Tab autocompletes when cursor is after a symbol, indents otherwise
function! ProcessTab()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-n>"
	endif
endfunction
inoremap <silent> <tab> <c-r>=ProcessTab()<cr>

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
" let g:ctrlp_user_command = 'cd %s && git ls-files -co --exclude-standard'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
map <Leader>p :CtrlP<CR>
map <Leader>P :CtrlPBuffer<CR>
