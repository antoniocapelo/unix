" Theme Options
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif
if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
endif

colorscheme solarized
set background=dark
"
" using Source Code Pro
set anti enc=utf-8
set guifont=Source\ Code\ Pro:h13

" Make vim more useful
set nocompatible

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" Make tabs as wide as two spaces
set tabstop=2

" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set listchars=tab:▸-   " Set tab icon

set list

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

"if exists("&relativenumber")
"  " Use relative line numbers
"  set relativenumber
"  au BufReadPost * set relativenumber
" endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>sw :call StripWhitespace ()<CR>

function! ReadJSAsJsx() 
    let g:jsx_ext_required = 0
endfunction

noremap <leader>x :call ReadJSAsJsx () <CR>
noremap <leader>sx :set syntax=javascript.jsx<CR>
noremap <leader>sh :set syntax=html<CR>


execute pathogen#infect()

set clipboard=unnamed
syntax on
filetype plugin indent on

set nocompatible              " be iMproved, required
filetype off                  " required

set runtimepath^=~/.vim/bundle/ctrlp.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins  ----------------------------------------------
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' 
Plugin 'pangloss/vim-javascript' 
Plugin 'elzr/vim-json' 
Plugin 'git://git.wincent.com/command-t.git' 
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'L9'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tmhedberg/matchit'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'burnettk/vim-angular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/gitignore'

" vim easy find accross current dir
Plugin 'dkprice/vim-easygrep'
Plugin 'mxw/vim-jsx'
Plugin 'suan/vim-instant-markdown'
Plugin 'vim-scripts/copypath.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'mustache/vim-mustache-handlebars'
"Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle 'glanotte/vim-jasmine'
Bundle "justinj/vim-react-snippets"

" Optional:
Bundle "honza/vim-snippets"

" NOTE: All of your Plugins must be added before the following line
call vundle#end()            " required
" Plugins END ----------------------------

filetype plugin indent on    " required

" Non-Plugin stuff go after this line:
" ------------------------------------
set autoread
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set pastetoggle=<F2>  " Temporarily switch to “paste mode”
" For a codebase that uses a single tab character that appears 4-spaces-wide for each indent:
" set tabstop=1 softtabstop=0 noexpandtab shiftwidth=1
" 4 character tabs and indents 
set tabstop=4       " 8 is too much
set shiftwidth=4    " 8 is too much
set noexpandtab

" Tabs to be expanded to spaces
set expandtab       " expand tabs
set smarttab  " Cause backspace to backspace over expanded tabs

" Stuff from @miguelcnf's .vimrc
set nrformats-=octal
set autoindent         " Auto indent new lines
set smartindent        " Make autoindent smarter
set backspace=indent,eol,start " more powerful backspacing
set hidden             " Hide buffers when they are abandoned
set history=50         " keep 50 lines of command line history
set smartcase          " Do smart case matching when searching
set ruler              " show the cursor position all the time
set scrolloff=3        " Never lean to the top or bottom of the window
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set softtabstop=2 tabstop=2 shiftwidth=4 expandtab " Default whitespace settings
set completeopt=menuone,longest,preview " Better completion menu

" Set filetypes
au BufRead,BufNewFile *.json set filetype=json

" Treat ejs files as html
if has("autocmd")
  au BufRead,BufNewFile *.ejs setfiletype html
endif

" JavaScript libraries syntax
let g:used_javascript_libs = 'angularjs,react,underscore'
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 'v'

let g:SuperTabDefaultCompletionType = "context"

" Mappings for diffing and merging
map ]] ]c
map [[ [c

" Usign ,2 ,3 and ,4 for diffgetting LOCAL, BASE and REMOTE
map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>

" delete without yanking
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d

" Accessing system clipboard
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-x> :call setreg("\"",system("pbpaste"))<CR>p

" Set the splits to the logical direction
set splitbelow
set splitright

" Use Ctrl-j and Ctrl-k for navigation to same indentation
nnoremap <C-k> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <C-j> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" Use ,W to strip all trailing whitespace on current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,ft to fold HTML tags
nnoremap <leader>ft Vatzf

" ,v to reselect the text that was just pasted to perform commands (like indentation) on it
nnoremap <leader>v V`]

" use jj to exit back to Normal Mode (nice tip from Steve Losh)
inoremap jj <ESC>

" ,w to a new vertical split
nnoremap <leader>w <C-w>v<C-w>l

" clean search by pressing ,/
nmap <silent> ,/ :nohlsearch<CR>

" use ,l and ,h to move between left-right windows
nmap <leader>l <C-w>l
nmap <leader>h <C-w>h

" ,s to activate or deactive spellcheck
nnoremap <leader>s :setlocal spell!<cr>

"visual selection of the lines that have the same indent level or more as the current line.
function! SelectIndent ()
  let temp_var=indent(line("."))
  while indent(line(".")-1) >= temp_var
    exe "normal k"
  endwhile
  exe "normal V"
  while indent(line(".")+1) >= temp_var
    exe "normal j"
  endwhile
endfun
nmap <leader>i :call SelectIndent()<cr>

" backspace acting as h on visual mode
:vmap <BS> h

" using Tab for calling out Ctrl-P
" imap <Tab> <C-P>

inoremap <leader>p <C-x><C-o>

set omnifunc=csscomplete#CompleteCSS
set omnifunc=syntaxcomplete#Complete

let g:vim_json_syntax_conceal = 0

" vim markdown options
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
nnoremap <leader>md :InstantMarkdownPreview<CR>

" make nerdtree open on the left
let g:NERDTreeWinPos = "left"

" set jasmine options
nnoremap <leader>jm :set filetype=jasmine.javascript syntax=jasmine

" nerdtree line numbers
let NERDTreeShowLineNumbers=1

" indent linebreaks
:set breakindent

" setting up angular vim
let g:angular_filename_convention = 'titlecased'
let g:angular_test_directory = 'test/specs'

" go to tag definition
nnoremap <leader>d <C-]><CR>
let g:easytags_always_enabled = 0
" turn off vimeasy-tags
nnoremap <leader>e  :let g:easytags_always_enabled = 1<CR>

""" Make configs
"{{{

  " run python
  autocmd BufNewFile,BufRead *.py set makeprg=clear;python2.7\ %
  autocmd BufNewFile,BufRead *.py set autowrite

  " run node.js
  autocmd BufNewFile,BufRead *.js set makeprg=clear;node\ %
  autocmd BufNewFile,BufRead *.js set autowrite

  " compile c code
  autocmd FileType c set makeprg=clear;make\ test
  autocmd FileType c set autowrite

  " compile LaTeX
  autocmd BufNewFile,BufRead *.tex set makeprg=clear;pdflatex\ %
  autocmd BufRead *.tex set autowrite

  " compile Markdown
  autocmd BufNewFile,BufRead *.md set makeprg=redcarpet\ %\ >/tmp/%<.html
  autocmd BufNewFile,BufRead *.md set autowrite

"}}}
