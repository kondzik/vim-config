call pathogen#infect()
call pathogen#helptags()

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set encoding=utf-8

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set bs=2     " make backspace behave like normal again
if has('gui_running')
    set mouse=a " enable mouse
endif


" Rebind <Leader> key
let mapleader = ","

set hidden

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows
nmap <Leader>l :set list!<CR> " Toggle whitespace display

set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" easier moving of code blocks
" Try to go into visual mode (v), then select several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Disable syntax highlight for files larger than 50 MB
autocmd BufWinEnter * if line2byte(line("$") + 1) > 50000000 | syntax clear | endif

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
" set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" Useful settings
set history=700
set undolevels=700
set cursorline
set scrolloff=3


" use spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" ============================================================================
" Python IDE Setup
" ============================================================================
" Powerline
" cd ~
" git clone https://github.com/Lokaltog/powerline.git
" cd powerline
" sudo python setup.py install
" pip3 install --user git+git://github.com/Lokaltog/powerline
set rtp+=$HOME/.local/lib/python/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

if has('gui_running')
    syntax enable
    set background=dark
    colorscheme solarized
endif

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*build/*
set wildignore+=*dist/*
set wildignore+=*.egg-info/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
let ropevim_enable_shortcuts = 1
let g:pymode_lint = 1
let g:pymode_lint_unmodified = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_run = 0
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 1
let g:pymode_syntax = 1
let g:pymode_virtualenv = 1

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" NERDTree
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git
nmap <leader>t :NERDTreeToggle<CR>

" Display hidden files
let NERDTreeShowHidden=1

" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Ack for vim
" sudo apt-get install ack-grep
" cd ~/.vim/bundle
" git clone https://github.com/mileszs/ack.vim.git
nmap <leader>a <Esc>:Ack!

" Vim Git Gutter
" cd ~/.vim/bundle
" git clone https://github.com/airblade/vim-gitgutter.git
let g:gitgutter_enabled = 0
nmap <leader>gr :GitGutterToggle<CR>
nmap <leader>s :GitGutterPrevHunk<CR>
nmap <leader>d :GitGutterNextHunk<CR>

" Tagbar
" cd ~/.vim/bundle
" git clone git://github.com/majutsushi/tagbar
nmap <F8> :TagbarToggle<CR>

" Sorted according to their order in the source file
let g:tagbar_sort = 0

" ============================================================================
" Filetype detection
" ============================================================================
au BufNewFile,BufRead *.tac setl ft=python " .tac files are used in twisted
au BufNewFile,BufRead *.json setl ft=javascript
au BufNewFile,BufRead *.txt setl ft=text

