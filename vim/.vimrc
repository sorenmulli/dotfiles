 " Install vim-plug if it isn't already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

endif

call plug#begin('~/.vim/plugged')

" Git support
Plug 'tpope/vim-fugitive'

" Using quoting
Plug 'tpope/vim-surround'

" Follow file indent
Plug 'xeyownt/vim-sleuth'

" Bedre perl-highlighting
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp highlight-all-pragmas moose test-more try-tiny method-signatures' }

" NeoMake (håndterer bl.a. linting)
Plug 'neomake/neomake'

" file system integration
Plug 'francoiscabrol/ranger.vim'

" More colors
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-python/python-syntax'

" Python folding
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'

" Snippets
Plug 'sirver/UltiSnips'

" Modules loaded dependant on whether on job or not
if isdirectory(expand("/home/sorenwh"))
  "LaTeX
  Plug 'lervag/vimtex'

  " Python completion
  Plug 'Valloric/YouCompleteMe'
else
  " vim-test - lader dig køre perl-tests inde fra din editor
  Plug 'janko-m/vim-test'
  Plug '~/dev-utils/conf/vim' 

  " Mojolicious syntax highlighting (vores web-framework):
  Plug 'yko/mojo.vim'

  " LESS syntax highlighting
  Plug 'groenewege/vim-less'
endif

call plug#end()

let mapleader = ","
let maplocalleader = '.'
"
" vim-perl configuration {{{ 

" highlight advanced perl vars inside strings                                                                                                                                                               
let perl_extended_vars=1                                                                                                                                                               

" do highlighting on POD comments                                                                                                                                                               
let perl_include_pod=1                                                                                                                                                               

" increase number of lines used when syntax highlighting                                                                                                                                                               
let perl_sync_dist=1000                                                                                                                                                               
autocmd BufEnter * :syntax sync minlines=300  

" allow subroutine signatures                                                                                                                                                               
let perl_sub_signatures=1    


" }}} 

let g:neomake_python_pylint_maker = {
  \ 'args': [
  \ '-d', 'C0103, C0111, E302, W191, E223, E117, E501, E202, mixed-indentation, trailing-whitespace, line-too-long, bad-whitespace, bad-continuation, too-many-instance-attributes, too-many-arguments, too-many-locals, multiple-statements, len-as-condition, redefined-outer-name',
  \ '-f', 'text',
  \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
  \ '-r', 'n'
  \ ],
  \ 'errorformat':
  \ '%A%f:%l:%c:%t: %m,' .
  \ '%A%f:%l: %m,' .
  \ '%A%f:(%l): %m,' .
  \ '%-Z%p^%.%#,' .
  \ '%-G%.%#',
  \ }
let g:neomake_python_enabled_makers = ['pylint']

source ~/dotfiles/vim/helpers.vim

nnoremap <F9> :call OpenModuleUnderCursor()<CR>
nnoremap <F8> :Neomake<CR>

"TeX stuff
let g:vimtex_quickfix_latexlog = {'default' : 0}
set spelllang=en_gb,da
autocmd FileType tex set spell
let g:tex_flavor = "latex"
set conceallevel=2
let g:tex_conceal="abdgm"

let g:python_highlight_all = 1
let g:python_highlight_indent_errors  = 0

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_python_interpreter = '/home/sorenwh/anaconda3/bin/python'
let g:ranger_replace_netrw = 1
let g:SimpylFold_docstring_preview=1
"ULTISNIPS
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-x>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Snip settings

let g:UltiSnipsEditSplit="tabdo"
let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/vim/mysnips']

" Personal settings
let g:snips_author="Søren Winkel Holm"
let g:snips_email="swholm@protonmail.com"
let g:snips_github="github.com/sorenmulli"


set history=500

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Enable filetype plugins
filetype plugin on
filetype indent on


" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

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

" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set background=dark

" Set utf8 as standard encoding
set encoding=utf8

" to help with tmux
set mouse=a

" Use Unix as the standard file type
set ffs=unix,dos,mac

"Settings dependant on jobxx develop machine or not
if isdirectory(expand("/home/sorenwh"))
  set noexpandtab
  set softtabstop=0
  call neomake#configure#automake('nrwi', 500)
else
  set expandtab
endif

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


"go to definition
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

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

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

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

set wrap "Wrap lines
" Remap VIM 0 to first non-blank character
map 0 ^

"Pop up colour
hi Pmenu ctermbg=gray
"
"Folding colour
hi Folded ctermbg=235
hi FoldColumn ctermbg=235
hi SignColumn ctermbg=235
" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

noremap <leader>p "*p
noremap <leader>y "+y
noremap <leader>d "+d

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" nmap <leader>n :let $MYFILE=expand('%')<CR>:vertical :botright :terminal<CR>echo $MYFILE<CR>
" nmap <leader>m :let $MYFILE=expand('%')<CR>:vertical :botright :terminal<CR>python $MYFILE<CR>


nnoremap o o<Esc>
nnoremap O O<Esc>

" Easy indentation
inoremap <S-Tab> <C-O><lt><lt>
nnoremap <Tab> >>
nnoremap <S-Tab> <lt><lt>
vnoremap <Tab> >
vnoremap <S-Tab> <lt>


set shiftwidth=4
set autoindent
set shiftround
set tabstop=4
let g:SleuthDefaultWidth = "4"


 " Commenting blocks of code.
noremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>


