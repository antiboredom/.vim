" Automatically install vimplug if needed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.vim/plugged')

Plug 'crusoexia/vim-monokai'
Plug 'phanviet/vim-monokai-pro'
Plug 'tomtom/tcomment_vim'
Plug 'prettier/vim-prettier', {'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'henrik/vim-reveal-in-finder'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'posva/vim-vue'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-repeat'
Plug 'valloric/matchtagalways'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ap/vim-css-color'
Plug 'vim-scripts/paredit.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tikhomirov/vim-glsl'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" COLORS
" Dark background
set termguicolors
set background=dark
syntax on
" colorscheme monokai_pro
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

" allow vim to switch from buffers with unsaved changes
set hidden

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
" set cursorline

" Hide scrollbars on mac
set guioptions=

set lazyredraw

set synmaxcol=200

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

" Don't show YCM's preview window [ I find it really annoying ]
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
"
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_complete_in_comments = 1
" let g:ycm_complete_in_strings = 1

" only lint when saved
" let g:ale_lint_on_text_changed = 'never'

" virtualenv for ale
" let g:ale_virtualenv_dir_names = ['env', 'venv', '.env', '.venv', '../env', 'env2']

" always show the sign gutter
" let g:ale_sign_column_always = 1

" let g:ale_sign_error = '>'
" let g:ale_sign_warning = '-'

" line length
" let g:ale_python_flake8_options = '--max-line-length=100'

" make supertab start at the top, not bottom:
let g:SuperTabDefaultCompletionType = "<c-n>"

" fix vim-vue slowness
let g:vue_disable_pre_processors=1

" no trailing commas for prettier
let g:prettier#config#trailing_comma = 'none'

" max line length that prettier will wrap on
let g:prettier#config#print_width = 100

" let prettier be async
let g:prettier#exec_cmd_async = 1

" let g:prettier#config#parser = 'babylon'

" gitgutter yells at me if i don't include this
" let g:gitgutter_realtime = 0
"
" ================== SUGGESTED COC SETTINGS =======================

" Give more space for displaying messages.
set updatetime=300
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
set signcolumn=yes

" ================== END SUGGESTED COC SETTINGS =======================

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.gif,*.jpeg
set wildignore+=**/node_modules
set wildignore+=**/env
set wildignore+=**/venv

" ================== CUSTOM KEYS =================

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" let mapleader=","
nnoremap <SPACE> <Nop>
let mapleader=" "

" quick save
nnoremap <leader><leader> :w<cr>

" ctrl-p to fzf gitfiles
map <C-S-p> :GFiles<CR>

" view buffers
map <Leader>b :Buffers<CR>

" view all files
map <Leader>p :Files<CR>

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

" add mouse support
set mouse=a

" transparent bg / good for tmux
hi Normal guibg=NONE ctermbg=NONE
