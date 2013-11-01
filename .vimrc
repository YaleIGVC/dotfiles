" Keep nocompatible mode set
set nocompatible

" Color
set t_Co=256
syntax on
colorscheme smyck

" Have vim jump to the last line of a closed file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Settings
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set incsearch       " Incremental search
set hidden          " Hide buffers when they are abandoned
set number          " Show line numbers
set autoindent      " Always set autoindenting on
set copyindent      " Copy previous indentation in autoindenting
set hlsearch        " Highligh search terms
set incsearch       " Show search matches as you type
set expandtab       " Expand tabs to spaces
set tabstop=4       " Tab length is 4 spaces
set shiftwidth=4    " Shift 4 spaces when shifting
set shiftround      " Use multiple of shiftwidth when shifting
set wrap            " Wrap lines at the edge of the screen
set foldmethod=indent
                    " Fold on indents
set backspace=indent,eol,start
                    " Backspace over everything in insert mode
set undolevels=1000 " Many undo
set title           " Set the title of the window
set noerrorbells    " Stop beeping
set wildmenu        " Use the wildmenu
set wildmode=list:longest,full
                    " Set wildmenu mode
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
                    " Stop wildmenu from showing certain files
set nobackup        " Don't take backups since vcs is usually used
set noswapfile      " Don't use swapfiles
set list            " Allow characters to be listed in full
set listchars=tab:>~,trail:~,nbsp:~
                    " Rogue tabs and spaces are shown differently
set pastetoggle=<F2>
                    " Make pasting easier
set completeopt=longest,menuone
                    " completion inserts longest common text and menu pops up
                    " with only one match
set clipboard=unnamedplus
                    " Use X11 clipboard
set mouse=a         " Use the mouse for scrolling and copy/paste
set cmdheight=2     " Prevent extra enter hit after every command

" Plugins used:
" === Windows ===
" TagList
" NERDTree
" MiniBufExplorer
" Bclose
"
" === Editing ===
" Surround
" NERDCommenter
" EasyMotion
"
" === Viewing ===
" MatchIt
"
" === Syntax ===
" vim-pandoc
call pathogen#infect()
filetype plugin indent on

" Mappings
let mapleader = ","
" Quickly edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Plugin mappings
nmap <silent> <leader>t :TlistToggle<CR>
nmap <silent> <leader>n :NERDTreeToggle<CR>
" Buffer mappings
nmap <silent> + <C-w>+
nmap <silent> - <C-w>-
nmap <silent> > <C-w>>
nmap <silent> < <C-w><
nmap <silent> <Bar> <C-W><Bar>
nmap <silent> _ <C-w>_
nmap <silent> <leader>h <C-w><S-h>
nmap <silent> <leader>j <C-w><S-j>
nmap <silent> <leader>k <C-w><S-k>
nmap <silent> <leader>l <C-w><S-l>
nmap <silent> <C-n> :bnext<CR>
nmap <silent> <C-p> :bprev<CR>
nmap <silent> <leader>d <Plug>Kwbd
nmap <silent> <leader>c :bufdo bdelete<CR>
" General mappings
nmap <silent> <leader>< :<<CR>
nmap <silent> <leader>> :><CR>
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> j gj
nmap <silent> k gk
nmap <silent> <leader>ac :%y+<CR>
nmap <silent> <leader>s :w<CR>
nmap <silent> <leader>q :qall!<CR>
nmap <silent> <leader>x :xall<CR>
nmap ; :

" File definitions
au BufNewFile,BufRead *.spin        setf spin
au BufNewFile,BufRead *.tpl         setf html

" Create run mappings for various filetypes
if has('autocmd')
    " Web specific whitespace
    autocmd filetype html,xml set listchars-=tab:>.

    " C++11 feature
    autocmd filetype cpp,cxx let c_no_curly_error=1

    " Compile/syntax check
    autocmd Filetype java map <F4> <ESC>:w<CR>:!ant -find build.xml compile<CR>
    autocmd FileType php map <F4> <ESC>:w<CR>:!php5 -l %<CR>
    autocmd FileType python map <F4> <ESC>:w<CR>:!python -c "import py_compile, sys; sys.stderr=sys.stdout; py_compile.compile(r'%')"<CR>
    autocmd FileType spin map <F4> <ESC>:w<CR>:!bstc %<CR>

    " Run
    autocmd FileType java map <F5> <ESC>:w<CR>:!ant -find build.xml run 
    autocmd FileType php map <F5> <ESC>:w<CR>:!php5 % 
    autocmd FileType python map <F5> <ESC>:w<CR>:!python % 
    autocmd FileType sh map <F5> <ESC>:w<CR>:!bash % 
    autocmd FileType spin map <F5> <ESC>:w<CR>:!bstc -p0 % 
    au BufNewFile,BufRead *.ino set filetype=c
    au BufNewFile,BufRead *.ino set shiftwidth=2
    au BufNewFile,BufRead *.ino set tabstop=2
endif

" Mini Buffer Explorer settings
let g:miniBufExplMapWindowNavVim = 1

" NERD Tree settings
let NERDTreeChDirMode = 2

" Ctrlp settings
let g:ctrlp_map = '<leader>p'
let g:ctrlp_working_path_mode = ''
