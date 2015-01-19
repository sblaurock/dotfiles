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
Plugin 'Shougo/neocomplcache.vim'

call vundle#end()

syntax on " Syntax highlighting
filetype plugin indent on " Filetype detection
let mapleader="," " Remap leader key
set encoding=utf-8 " Use UTF-8 encoding
set modelines=0 " No file specific variables
set hidden " Allow switching from unsaved buffers
set wildmenu " Show command completion suggestions in status line
set wildmode=list:longest,full " ...even better suggestions
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
set noerrorbells " No bells
set novisualbell " ...no bells
set t_vb= " ...seriously, no bells
set notimeout ttimeout ttimeoutlen=200 " Quickly time out on keycodes
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set clipboard=unnamedplus,unnamed,autoselect " Share clipboard with OS
set scrolloff=3 " Always show 3 lines above and below cursor
set noshowmode " Don't show mode indicator
set showcmd " Show information about current command
set cursorline " Highlight line containing cursor
set ttyfast " Prevent slow scrolling
set incsearch " Match on keypress instead of enter
set nofoldenable " Disable code folding
set shortmess=at " Shorter messages
set whichwrap=<,>,h,l " Allow cursor to wrap across lines
set history=1000 " Increase command history

" Save information across sessions
set viminfo=%,'50
set viminfo+=\"100,:100
set viminfo+=n~/.viminfo

" Tab settings (2 spaces)
set shiftwidth=2
set softtabstop=2
set expandtab

colorscheme jellybeans

" Key remappings
nnoremap <leader>h :nohl<CR><C-L>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>a :Ack 
nnoremap <leader>c :SyntasticCheck<CR>

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically 'cd' into directory of currently open file
autocmd BufEnter * silent! lcd %:p:h

" Omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Syntax mapping
au BufNewFile,BufRead *.swig setlocal ft=htmldjango
au BufNewFile,BufRead *.json setlocal ft=javascript
au BufNewFile,BufRead *.mh setlocal ft=mason

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" vim-gitgutter
let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 1

" ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*,*.so,*.swp,*.zip,*.mp3
let g:ctrlp_regexp = 1
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'ra'

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=1

" indentLine
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_insert_char_pre = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_max_list = 50
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default'    : '',
  \ 'javascript' : $HOME . '/.vim/dict/javascript.dict,' . $HOME . '/.vim/dict/jQuery.dict'
  \ }

" Restore cursor position on reopen
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
