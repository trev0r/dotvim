set nocompatible
" Pathogen 
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.gvimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost .gvimrc source ~/.gvimrc

syntax on
if !&diff && has('gui_running')
  filetype plugin indent on " Enable filetype-specific indenting and plugins
endif
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/fts/thrift.vim
au! Syntax thrift source ~/.vim/fts/thrift.vim
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=html

" No sound on errors
set noerrorbells
set novisualbell
set visualbell t_vb=
set tm=500


" Make command line two lines high
set ch=2
" Number lines
set number
" Set the status line 
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
" set the gui options 
set guioptions=ace
if has("gui_running")
set fuopt=maxvert,maxhorz
endif
" Keep some stuff in the history
set history=100
" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8
" Dollar sign character marker
set cpoptions+=$
" Highlight search
set hls
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Looks
if has("gui_running")
colorscheme wombat
else
  colorscheme wombat256i
endif
set guifont=DroidSansMonoSlashed
set bg=dark
set tabstop=4
set smarttab
set shiftwidth=2
set autoindent
set smartindent
set expandtab
set wrap
" Wrap lines at 120 chars
set textwidth=80
" highlight matching braces
set showmatch
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
"Better line navigation
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l 
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
"if has("gui_macvim")
"  macmenu &File.New\ Tab key=<nop>
"  map <D-t> :CommandT<CR>
"else
  map <C-t> :CommandT<CR>
"endif
let g:CommandTMaxHeight = 15

set wildignore=__init__.py,*.pyc,*.class
set wildignore+=tools/tellapartcreativez/**
set wildignore+=rye/scripts/tellapart/**
set wildignore+=tools/spanakopita/tellapart/**
set wildignore+=tools/tellapartdashboardz/tellapart*/**
set wildignore+=tools/tellapartdashboardz/static/app/**
set wildignore+=tools/mission-control/node_modules/**
set wildignore+=tools/mission-control/tmp/**
set wildignore+=third_party/**
set wildignore+=selenium/**
set wildignore+=lib/**
set wildignore+=bin/**
set wildignore+=include/**
set wildignore+=node_modules/**
set wildignore+=py/tellapart/frontend/dashboard/static/app/js/node_modules/**
set wildignore+=tmp/**

"endif
"
""Use jshint
let g:syntastic_javascript_checkers=['jshint']
"Use python
let g:syntastic_python_checkers=['pyflakes', 'python']
" Delete trailing whitespace on file write
autocmd BufWritePre * :%s/\s\+$//e

"TEX STUFF
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
