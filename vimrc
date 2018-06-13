" Automatically install vimplug if needed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.vim/plugged')

Plug 'crusoexia/vim-monokai'
Plug 'tomtom/tcomment_vim'
Plug 'prettier/vim-prettier', {'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'henrik/vim-reveal-in-finder'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/vim-easy-align'
" " Plug 'suan/vim-instant-markdown'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'posva/vim-vue'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-repeat'
Plug 'valloric/matchtagalways'
" " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" " Plug 'junegunn/fzf.vim'
" " Plug 'w0rp/ale'
Plug 'ambv/black'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ap/vim-css-color'
" Plug 'FelikZ/ctrlp-py-matcher'

call plug#end()


" COLORS
" Dark background
set termguicolors
set background=dark
syntax on
colorscheme monokai

" Open new split panes to right and bottom
set splitbelow
set splitright

" save undo history
set undodir=~/.vimundo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload


" ============== searching ==============
"
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase
"
" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=1

" ====================================

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" ================ Indentation ======================

set autoindent
" set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" make python files use 4 spaces rather than 2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

" line wrap stuff

set wrap      " Wrap lines
set linebreak " Wrap lines at convenient points

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Always show current position
set ruler
set number

" Highlight current line
set cursorline

" Hide scrollbars on mac
set guioptions=

" ============== netrw ====================
" get rid of the netrw help info
" let g:netrw_banner = 0
" make netrw act more like nerdtree
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
" map <Leader>n :Lexplore<CR>


" =============== PLUGIN SPECIFIC ==============

" no trailing commas for prettier
let g:prettier#config#trailing_comma = 'none'

" max line length that prettier will wrap on
let g:prettier#config#print_width = 100

" let prettier be async
let g:prettier#exec_cmd_async = 1

" let g:prettier#config#parser = 'babylon'

" gitgutter yells at me if i don't include this
" let g:gitgutter_realtime = 0
set updatetime=100

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=**/node_modules
set wildignore+=**/env
set wildignore+=**/venv

" ctrlp ignore rules
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|venv\|env\|log\|dist\|build\|tmp$',
  \ 'file': '\.so$\|\.pdf$\||\.png$\|\.jpg$\|\.gif$\|\.dat$|\.DS_Store$'
  \ }

" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" ================== CUSTOM KEYS =================

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
let mapleader=","

" toggle wrap
map <Leader>w :set wrap!<CR>

" toggle spelling
map <Leader>s :set spell!<CR>

" Tcomment
" toggle comment
map <Leader>c :TComment<CR>
" use comfortable command-/ for toggling comments
map <D-/> :TComment<CR>

" show netrw
" map <Leader>n :e .<CR>
" show nerdtree
map <Leader>n :NERDTreeToggle<CR>

" reveal file in finder
map <Leader>r :Reveal<CR>

" use goyo
map <Leader>g :Goyo<CR>

" neoformat
map <Leader>f :Neoformat<CR>

" better keys for switching between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction

onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

" use tab and shift-tab to cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" liquidsoap
au BufRead,BufNewFile *.liq set filetype=liquidsoap
