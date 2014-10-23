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


set vb t_vb= 

"""""""""""""""""""" GLOBAL

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'The-NERD-tree'
Plugin 'msanders/snipmate.vim'
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/colorizer'

call vundle#end()
filetype plugin indent on

"let g:Powerline_symbols = 'fancy'
let g:EasyMotion_leader_key = ','
let mapleader=","

autocmd FileType text,txt,tex,markdown set wrap lbr nolist spell spl=fr,en
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
set breakindent
set showbreak=\ \
set breakindentopt=...

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

highlight ColorColumn ctermbg=238 guibg=#444444
call matchadd('ColorColumn', '\%81v', 100)

" highlight Comment cterm=underline ctermbg=Blue ctermfg=White
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

"" Mouse pointer

if &term =~ "^rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;White\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;15\x7"
  silent !echo -ne "\033]12;15\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[5 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif
"""Airline
let g:airline_theme='vava'

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : '<N>',
      \ 'i'  : '<I>',
      \ 'R'  : '<R>',
      \ 'c'  : '<C>',
      \ 'v'  : '<V>',
      \ 'V'  : '<V>',
      \ 's'  : '<S>',
      \ 'S'  : '<S>',
      \ }

let g:airline_section_b = '%{getcwd()}/%t'
let g:airline_section_y = '[%c:%l] %p%%'
let g:airline_section_c = '%m'
let g:airline_section_x = ''
let g:airline_section_z = ''
