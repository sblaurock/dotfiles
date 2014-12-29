" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'

call vundle#end()

syntax on " Syntax highlighting
filetype plugin indent on " Filetype detection
set hidden " Allow switching from unsaved buffers
set wildmenu " Better command-line completion
set showcmd " Show partial commands
set hlsearch " Highlight searches
set ignorecase " Case insensitive search
set smartcase " ...except when using capital letters
set shell=bash " Use Bash shell
set t_Co=256 " 256 color mode
set mouse=a " Enable mouse support
set number " Show line numbers
set backspace=indent,eol,start " More sane backspacing
set autoindent " Preserve line indentation settings
set nostartofline " More sane line traversing
set ruler " Display cursor position in status line
set laststatus=2 " Always display status line
set confirm " Use dialog for unsaved changes
set visualbell " Use visual bell instead of beep
set t_vb= " Disable visual bell and beep
"set cmdheight=2 " 2-line command window height
set notimeout ttimeout ttimeoutlen=200 " Quickly time out on keycodes
set pastetoggle=<F11> " F11 toggle between 'paste' and 'nopaste'
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace

" Tab settings (2 spaces)
set shiftwidth=2
set softtabstop=2
set expandtab

colorscheme jellybeans

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 1

" (...not so) Friendy reminders
nnoremap <Left> :echoe "Use h (n)"<CR>
nnoremap <Right> :echoe "Use l (u)"<CR>
nnoremap <Up> :echoe "Use k (n)"<CR>
nnoremap <Down> :echoe "Use j (y)"<CR>

" Key remappings
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
nnoremap <C-L> :nohl<CR><C-L>
map Y y$
