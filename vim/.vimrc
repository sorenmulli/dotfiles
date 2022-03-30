" Neovim should be able to read vim plugins
if has('nvim')
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
endif

" Install vim-plug if it isn't already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " Indentation guides
  Plug 'thaerkh/vim-indentguides'
  Plug 'frazrepo/vim-rainbow'
  " Git support
  Plug 'tpope/vim-fugitive'
  " Using quoting
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  " Bedre perl-highlighting
  Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp highlight-all-pragmas moose test-more try-tiny method-signatures' }
  " Fuzzyfinding
  Plug 'junegunn/fzf'
  " More colors
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'vim-python/python-syntax'
  " Python folding
  Plug 'tmhedberg/SimpylFold'
  Plug 'Konfekt/FastFold'
  " Code completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Snippets
  Plug 'sirver/UltiSnips'
  Plug 'christoomey/vim-conflicted'
  " Show differences (must be fixed for async)
  if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
  else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
  endif
  Plug 'lervag/vimtex'
call plug#end()

let mapleader = ","
let maplocalleader = '.'

" vim-perl configuration {{{
" highlight advanced perl vars inside string
let perl_extended_vars=1
" do highlighting on POD comments
let perl_include_pod=1
" increase number of lines used when syntax
let perl_sync_dist=1000
autocmd BufEnter * :syntax sync minlines=300
" allow subroutine signatures
let perl_sub_signatures=1
" }}}

source $HOME/dotfiles/vim/helpers.vim

nnoremap <F9> :call OpenModuleUnderCursor()<CR>

" coc.nvim related settings
source $HOME/dotfiles/vim/cocstuff.vim

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"TeX stuff
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_fold_enabled = 1
    " Okular recommended settings
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif

set spelllang=en_gb,da
set spellfile=~/dotfiles/vim/en.utf-8.add
hi clear SpellBad
hi SpellBad cterm=underline

autocmd FileType tex,md,gitcommit set spell
autocmd FileType tex,md,gitcommit set wrap

let g:vimtex_syntax_conceal_disable=1

let g:python_highlight_all = 1
let g:python_highlight_indent_errors  = 0

let g:SimpylFold_docstring_preview=1

"ULTISNIPS
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-x>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Snip settings

let g:UltiSnipsEditSplit="tabdo"
let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/vim/mysnips']

set history=500

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Enable filetype plugins
filetype plugin on


" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Colours
colorscheme onedark

" Enable syntax highlighting
syntax enable

" Highlight trailing whitespaces
set list
set listchars=trail:~,tab:>-,nbsp:␣

set t_Co=256

set background=dark

" Set utf8 as standard encoding
set encoding=utf8

" to help with tmux
set mouse=a

" Use Unix as the standard file type
set ffs=unix,dos,mac

"Settings dependant on being async or not
if isdirectory(expand("/home/sorenwh")) || has('nvim')
  " set noexpandtab
  " set softtabstop=0
  set updatetime=100
else
  " set expandtab
endif

" Don't save in same folder; annoys git
set backupdir=$HOME/.vim/swap
set directory=$HOME/.vim/swap

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
au CursorHold * if getcmdwintype() == '' | checktime | endif

" Control windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Control tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Quickly open a buffer for scribble
map <leader>bn :tabedit ~/buffer<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Map <Space> to / (search)
map <space> /

nnoremap ½ :call fzf#run({'source': 'git ls-files', 'sink': 'tabedit', 'down': '40%'})<CR>
nnoremap § :call fzf#run({'source': 'find .', 'sink': 'tabedit', 'down': '40%'})<CR>
nnoremap <leader>½ :call fzf#run({'source': 'find ~/', 'sink': 'tabedit', 'down': '40%'})<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
map <leader>tw :tabedit .

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Quickly edit/reload this configuration file
nnoremap gev :tabedit $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

" Delete trailing whitespaces on save for some filetypes
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Linebreak on 500 characters
set lbr
set tw=500
set number
set relativenumber

" set wrap
set nowrap

" Remap increment/decrement number as I use ctrl+A for tmux
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>
" Remap VIM 0 to first non-blank character
map 0 ^

"Folding colour
hi Folded ctermbg=235
hi FoldColumn ctermbg=235
hi SignColumn ctermbg=235

"Insert newlines quickly
nmap <leader>O O<Esc>
nmap <leader>o o<Esc>

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

noremap <leader>p "*p
noremap <leader>y "+y
noremap <leader>d "+d

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Easy indentation
inoremap <S-Tab> <C-O><lt><lt>
nnoremap <Tab> >>
nnoremap <S-Tab> <lt><lt>
vnoremap <Tab> >
vnoremap <S-Tab> <lt>

" Handle indentation
set autoindent
set shiftround

set shiftwidth=4
set softtabstop=4

set expandtab

set guicursor+=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
let g:rainbow_active = 1

if v:version > 704 || has("nvim")
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif

