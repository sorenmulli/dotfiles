 " Install vim-plug if it isn't already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:SleuthDefaultWidth = "4"
call plug#begin('~/.vim/plugged')
"LaTeX
Plug 'vim-latex/vim-latex'

" Follow file indent
Plug 'xeyownt/vim-sleuth'

" Mojolicious syntax highlighting (vores web-framework):
Plug 'yko/mojo.vim'

" LESS syntax highlighting
Plug 'groenewege/vim-less'

" Bedre perl-highlighting
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp highlight-all-pragmas moose test-more try-tiny method-signatures' }

" NeoMake (håndterer bl.a. linting)
Plug 'neomake/neomake'

" vim-test - lader dig køre perl-tests inde fra din editor
Plug 'janko-m/vim-test'

" Vores egne vim-moduler
if isdirectory(expand("~/dev-utils"))
  Plug '~/dev-utils/conf/vim'
end
call plug#end()

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

fun! OpenModuleUnderCursor()
  set iskeyword+=:
  let currentIdent = expand('<cword>')
  set iskeyword-=:
  e `=system("perlopen -f " . currentIdent)`
endfun

nnoremap <F10> :call OpenModuleUnderCursor()<CR>


set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

let mapleader = ","

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

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Search with space
map <space> /
map <C-space> ?
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

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Linebreak on 500 characters
set lbr
set tw=500
set number

set wrap "Wrap lines
" Remap VIM 0 to first non-blank character
map 0 ^


" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>


" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

nmap <leader>n :let $MYFILE=expand('%')<CR>:vertical :botright :terminal<CR>echo $MYFILE<CR>
nmap <leader>p :let $MYFILE=expand('%')<CR>:vertical :botright :terminal<CR>python $MYFILE<CR>

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

set softtabstop=0
set noexpandtab
set shiftwidth=4
set autoindent
set shiftround
set tabstop=4
