vim9script
# hehe

filetype plugin on
syntax on


if !isdirectory("/home/arch/.vim/undodir")
    call mkdir("/home/arch/.vim/undodir", "", 0755)
endif

set nocompatible
set omnifunc=syntaxcomplete#Complete
set mouse=
set foldmethod=indent
set undodir=~/.vim/undodir/
set undofile
set tw=70
set nowrap
set number
set relativenumber

# sometimes i mess up on saving, and apparently :update is a new hip way of
# saving files
command! -bar -nargs=* -complete=file -range=% -bang W update

# lol
inoremap <C-c> <esc>

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap j gj
nnoremap k gk
