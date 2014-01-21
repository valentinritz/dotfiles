" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim73/vimrc_example.vim or the vim manual
" and configure vim to your own liking!


"""""""""""""""""""" PLUGINS
set nocompatible
set laststatus=2
filetype off
set clipboard=unnamed

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set vb t_vb= 

"""""""""""""""""""" GLOBAL

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'The-NERD-tree'
Bundle 'msanders/snipmate.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/colorizer'
Bundle 'junegunn/goyo.vim'


filetype plugin indent on
filetype plugin on

let g:Powerline_symbols = 'fancy'
let g:EasyMotion_leader_key = ','
let mapleader=","

autocmd FileType text,txt,tex set wrap lbr nolist spell spl=fr,en
autocmd FileType html set spell spl=fr,en

set t_Co=256
colorscheme Monokai
set gfn=terminus
set go=i
" set go=e pour des tab en accord avec gtk
syntax on
set encoding=utf-8
set hidden
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftround
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ttyfast
set mouse=a
set nocompatible
set backup
set backupdir=~/.vim_backup
set noswapfile
set fileformats=unix,dos,mac
set laststatus=2
set expandtab
set softtabstop=2 tabstop=2 shiftwidth=2
set ruler
set wildignore=*.swp,*.bak
set wildmode=longest,list

"""""""""""""""""""" KEYBINDINGS

map cc <leader>c<space>
map # {v}! par 72<CR>
map & {v}! par 72j<CR>
map <F6> :setlocal spell! spelllang=en<CR>
map <F12> :set invhls<CR>
cmap <C-g> <C-u><ESC>
command! -bang W w<bang>

"""""""""""""""""""" PLUGINS

"let g:Powerline_symbols = 'fancy'
let g:CommandTMaxFiles=5000
let g:CommandTMaxHeight=12
map <C-o> :CommandT<CR>
let g:CommandTAcceptSelectionMap = '<CR>'
let g:CommandTCancelMap = '<C-g>'

let NERDChristmasTree = 1
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']
nmap <c-b> :NERDTreeToggle<cr>
nmap <C-n> <c-w><left><down><c-w><c-w>
nmap <C-p> <c-w><left><up><c-w><c-w>
nmap <C-o> <c-w><left><CR>

"""""""""""""""""""" FILES SPECIFIC
au BufRead mutt-* set ft=mail
au BufRead mutt-* set invhls
au BufNewFile *.html 0r ~/.vim/templates/html.txt
au BufRead,BufNewFile *.jsm setfiletype javascript
au BufRead,BufNewFile *.xul setfiletype xml
au filetype html,xml set listchars-=tab:>.

"""""""""""""""""""" CUSTOM FUNCTIONS


""" MAKE THE 81ST COLUMN STAND OUT
" (just the 81st column of wide lines... )

highlight ColorColumn ctermbg=red guibg=#444444
call matchadd('ColorColumn', '\%81v', 100)

""" Toggle relative/absolute numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <F10> :call NumberToggle()<cr>

""" FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    execute 'colorscheme ' . g:colors_name
  endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>

"""MapKey
nnoremap y "+y
vnoremap y "+y

map md :%! /bin/markdown --html4tags<CR>

let g:EasyMotion_mapping_w = '<Space>'
let g:EasyMotion_mapping_b = '<leader><Space>'

"""Latex-suite

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

"""Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1


""" DistractonFree mode
let g:centerinscreen_active = 0
 
function! ToggleCenterInScreen(desired_width)
  if g:centerinscreen_active == 0
    let l:window_width = winwidth(winnr())
    let l:sidepanel_width = (l:window_width - a:desired_width) / 2
    
    exec("silent leftabove " . l:sidepanel_width . "vsplit new")
    wincmd l
    exec("silent rightbelow " . l:sidepanel_width . "vsplit new")
    wincmd h
    let g:centerinscreen_active = 1
  else
    wincmd h
    close
    wincmd l
    close
    let g:centerinscreen_active = 0
  endif
endfunction
 
nnoremap <Leader>r :exec ToggleCenterInScreen(100)<CR>
