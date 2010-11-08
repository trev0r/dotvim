" Pathogen 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" Forget being compatible with good ol' vi
  set nocompatible
" Color Scheme
colorscheme wombat256
"colorscheme jellybeans
":colorscheme molokai
set guifont=Inconsolata=h14
" Turns off the audio bell
set vb
" Make command line two lines high
set ch=2
" Number lines
set number
" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide
" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=ac

" Keep some stuff in the history
set history=100
" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Dollar sign character marker
set cpoptions+=$

" command T
if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
  endif
"Highlight search
set hls
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"TEX STUFF
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


" Looks
set bg=dark
"if &background == "dark"
"hi normal guibg=black
"set transp=8
"endif "Soft tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Wrap lines at 120 chars
set textwidth=120
" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on
" highlight matching braces
set showmatch
" Turn on that syntax highlighting
syntax on

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu. See :help 'wildmenu'
set wildmenu

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

"Better line navigatio
 nnoremap j gj
  nnoremap k gk
  nnoremap 0 g0
  nnoremap $ g$
