set nocompatible                    " full vim

filetype off
set encoding=utf8                   " utf8 default encoding
set number                          " Show line numbers
set lines=60 columns=120            " Inital size

" Use ~/.vim instead of ~/vimfiles on Windows
" Makes it easier to sync settings across machines
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" TeSTTestCamelCaseT

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'digitaltoad/vim-jade'
Plugin 'moll/vim-node'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-fugitive'
Plugin 'xoria256.vim'
Plugin 'danro/rename.vim'
Plugin 'othree/html5.vim'
Plugin 'chaoren/vim-wordmotion'
call vundle#end()
filetype plugin indent on

" Tabs to spaces
set expandtab

set tabstop=4
set sts=4
set shiftwidth=4

set list listchars=tab:→\ ,trail:·

" nnoremap ;; A;<Esc>                 " ;; to add a semicolon to the end of the line

" <Ctrl> + <BS> to delete back a word in insert mode

imap <C-W> <C-o>a <C-o>b<C-o>dw
imap <C-BS> <C-W>

" Move vertically in the window through the horizontal splits...
map <C-J> <C-w>j<C-w>_
map <C-K> <C-w>k<C-w>_

" Move horizontally in the window through the vertical splits...
map <C-H> <C-w>h80<C-w>\|
map <C-L> <C-w>l80<C-w>\|

map <C-E> <C-w>=
map <C-8> 80<C-w>\|

set directory=.,$TEMP

" Configure GUI settings
if has("gui_running")

    set noerrorbells visualbell t_vb=
    autocmd GUIEnter * set visualbell t_vb=

    " Set the font based on OS
    if has("gui_win32")
        set guifont=Consolas:h13

        set directory=$HOME/.vim/swap//     " Location for swap files
        set backupdir=$HOME/.vim/swap//     " Location for backup files
    else
        set directory=~/.vim/swap//         " Location for swap files
        set backupdir=~/.vim/swap//         " Location for backup files
    endif

    " Dark background
    highlight Normal guibg=#222222 guifg=White
    colorscheme xoria256
else
    " Settings for non-windowed mode
    " ==============================

    colorscheme desert
endif

function! ToggleGUICruft()
  if &guioptions=='r'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=r')
  endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

" by default, hide gui menus
set guioptions=r

" Turn off logipat
let g:loaded_logipat = 1
set noeol
