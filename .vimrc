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
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'lilydjwg/colorizer'
Plugin 'tpope/vim-sleuth'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'elzr/vim-json'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'moll/vim-node'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'jasoncodes/ctrlp-modified.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'deris/vim-shot-f'
Plugin 'raimondi/delimitmate'
Plugin 'edsono/vim-matchit'

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
set list listchars=tab:»·,trail:·,nbsp:· " Display whitespace
set clipboard=unnamedplus,unnamed " Share clipboard with OS
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
set pastetoggle=<leader>V " Set paste mode toggle key binding
set autoread " Reload files modified outside of Vim
set wildignore+=*/.hg/*,*/.svn/*,*/tmp/*,*.so,*.swp,*.zip,*.mp3,*/node_modules/*,*.DS_Store
colorscheme spacegray

" Save information across sessions
set viminfo=%,'50
set viminfo+=\"100,:100
set viminfo+=n~/.viminfo

" Set preferred backup, swap and undo locations (create if necessary)
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup > /dev/null 2>&1
endif
set backupdir=~/.vim/backup//,/tmp//
set backup
if isdirectory($HOME . '/.vim/swp') == 0
  :silent !mkdir -p ~/.vim/swp > /dev/null 2>&1
endif
set directory=~/.vim/swp//,/tmp//
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/undo//,/tmp//
  set undofile
endif

" Indentation settings (2 spaces)
let g:indentationSize=2
execute "set shiftwidth=".g:indentationSize
execute "set softtabstop=".g:indentationSize

" Preserve visual selection when indenting
vnoremap < <gv
vnoremap > >gv

" Typo correction
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Clear highlighted matches
nnoremap // :noh<CR>
" Disable 'Ex' mode.
nnoremap Q <nop>
" Enter insert mode
nmap <Space> i
" Save keystrokes
nnoremap ; :
" Force write
cmap w!! w !sudo tee % >/dev/null

" Toggle file tree
nmap <leader>f :NERDTreeTabsToggle<CR>
" Fuzzy find
nnoremap <leader>p :CtrlP<CR>
" Fuzzy find (modified files)
nnoremap <leader>P :CtrlPModified<CR>
" Open commands file in new tab
nnoremap <leader>m :tabnew ~/.vim/commands<CR>
" Ack
nnoremap <leader>a :Ack 
" Check syntax
nnoremap <leader>s :SyntasticToggleMode<CR>
" Toggle indentation (tabs / spaces)
nnoremap <leader>\ :call <SID>TabToggle()<CR>
" Toggle indentation size (2 / 4)
nnoremap <leader>\| :call <SID>SizeToggle()<CR>
" Copy selected text
vnoremap <leader>c "*y
" Cut selected text
vnoremap <leader>x "*d
" Paste (preserve indentation)
inoremap <leader>v <ESC>"+p`]a
" Yank entire file
nnoremap <leader>y gg"+yG
" Save session and exit
nnoremap <leader>Q :call SaveAndExit()<CR>
" New tab
nnoremap <leader>t :tabnew<CR>
" Next tab
nnoremap <leader><Tab> :tabnext<CR>
" Previous tab
nnoremap <leader><S-Tab> :tabprevious<CR>
" Close tab
nnoremap <leader>q :tabclose<CR>
" Tabs by numbers
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
" Last tab
noremap <leader>0 :tablast<cr>
" Move focus between windows
nnoremap <leader>` <C-W><C-W>
" Remove trailing whitespace
nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" `open`
nnoremap <leader>o :!open .<CR>
" Compare staged changes against master
nnoremap <leader>gd :Gdiff<CR>
" View file on Github
nnoremap <leader>gh :Gbrowse<CR>
" Copy Github file URL to clipboard
nnoremap <leader>gH :Gbrowse!<CR>
" `git status`
nnoremap <leader>gs :Gstatus<CR>
" `git blame`
nnoremap <leader>gb :Gblame<CR>
" `git commit`
nnoremap <leader>gc :Gcommit<CR>
" `git pull`
nnoremap <leader>gp :Gpull<CR>
" `git push`
nnoremap <leader>gu :Gpush<CR>
" Toggle comment block
nnoremap <leader>/ :call NERDComment(0, "toggle")<CR>
vnoremap <leader>/ :call NERDComment(0, "toggle")<CR>

" Disable automatic comment insertion
augroup disable_comment_insertion
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Automatically 'cd' into directory of currently open file
augroup auto_cd
  autocmd!
  autocmd BufEnter * silent! lcd %:p:h
augroup END

" Omni completion
augroup omni_completion
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

" Syntax mapping
augroup syntax_mapping
  autocmd!
  autocmd BufNewFile,BufRead *.swig setlocal ft=htmldjango
  autocmd BufNewFile,BufRead *.json setlocal ft=javascript
  autocmd BufNewFile,BufRead *.mh setlocal ft=mason
  autocmd BufNewFile,BufRead *.json set ft=json
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END

" Save when losing focus or switching buffers
augroup auto_save
  autocmd!
  autocmd FocusLost,BufLeave * silent! wa
augroup END

" Reload files modified outside of Vim (paired with 'autoread')
augroup auto_reload
  autocmd!
  autocmd CursorHold,InsertEnter,FocusGained,BufEnter * checktime
augroup END

" Enable spellchecking for git commit messages
augroup spellcheck
  autocmd!
  autocmd FileType gitcommit setlocal spell
augroup END

" Immediately apply configuration changes
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Restore cursor position on reopen
function! RestoreCursor()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup restore_cursor
  autocmd!
  autocmd BufWinEnter * call RestoreCursor()
augroup END

" Save and exit
function! SaveAndExit()
  :NERDTreeTabsClose
  :mksession! ~/.vim/session.vim
  :wqa
endfunction

" Toggle tabs / spaces
function! s:TabToggle()
  if &expandtab
    set noexpandtab
    echo "Indentation set to tabs (" . g:indentationSize . ")."
  else
    set expandtab
    echo "Indentation set to spaces (" . g:indentationSize . ")."
  endif
endfunction

" Toggle indentation size
function! s:SizeToggle()
  let g:indentationMode=&expandtab ? 'spaces' : 'tabs'
  if g:indentationSize == 2
    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    let g:indentationSize=4
    echo "Indentation size set to 4 (" . g:indentationMode . ")."
  else
    set softtabstop=2
    set tabstop=2
    set shiftwidth=2
    let g:indentationSize=2
    echo "Indentation size set to 2 (" . g:indentationMode . ")."
  endif
endfunction

" Highlight trailing whitespace as error in visual mode
function! HighlightWhitespaceOn()
  match ErrorMsg '\s\+$'
endfunction
function! HighlightWhitespaceOff()
  match none
endfunction
augroup highlight_whitespace
  autocmd!
  autocmd insertEnter * call HighlightWhitespaceOff()
  autocmd insertLeave * call HighlightWhitespaceOn()
augroup END
call HighlightWhitespaceOn()

" nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeMinimalUI = 1
highlight Directory guifg=#FF0000 ctermfg=DarkBlue

" vim-airline
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0

" vim-gitgutter
let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 1

" ctrlp.vim
let g:ctrlp_regexp = 1
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|tmp|node_modules)$',
  \ 'file': '\v\.(so|swp|zip|mp3|DS_Store|mov|woff|svg|jpg|jpeg|png|ttf|eot)$'
  \ }
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<c-t>', '<cr>', '<2-LeftMouse>'],
  \ }
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_python_checkers = ['csslint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['jshint']
let g:syntastic_vim_checkers = ['vimlint']
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': []
  \ }

" indentLine
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" YouCompleteMe
let g:ycm_complete_in_strings = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_filetype_blacklist = { 'gitcommit' : 1 }

" html5.vim
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,underscore,requirejs,jasmine'

" vim-json
let g:vim_json_syntax_conceal = 0
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" ag.vim
if executable('ag')
  nnoremap <leader>a :Ag 
endif

" delimitMate
let delimitMate_expand_cr = 1
