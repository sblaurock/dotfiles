execute pathogen#infect()
syntax on
filetype plugin indent on
set shell=bash
set t_Co=256
set mouse=a
set number
colorscheme jellybeans

let g:airline#extensions#tabline#enabled = 1

let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 1

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
