set modeline

" smartcase = use all lowercase for case-insensitive search
set smartcase
set backspace=indent,eol,start
set nobackup

" f2: visual space indicators
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" f3: search highlighting
set hlsearch

" f4: cycle various line number settings
set number
set relativenumber

" default of 4 is too big for terminal
set tabstop=2

" Disable help docs
inoremap <F1>      <NOP>
noremap <F1>      <NOP>

" F-row toggle controls
nnoremap <F2>      :set list!<CR>
nnoremap <F3>      :set hlsearch!<CR>
" f4 impl from: https://superuser.com/a/604626/59068
nnoremap <F4>      :exe 'set nu!' &nu ? 'rnu!' : ''<CR>
nnoremap <F5>    :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>
nnoremap <F6>      :set spell!<CR>

filetype plugin on

" Paste from and to system clipboard
set clipboard=unnamed

" Vim plugins
source ~/.local/share/nvim/site/autoload/plug.vim
call plug#begin('~/.local/share/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'mxw/vim-jsx'

Plug 'dag/vim-fish'

" TODO: remove extraneous fzf pkgs
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
Plug 'dylanaraps/wal.vim'
" Plug 'chrisbra/Colorizer.vim'

call plug#end()

colorscheme wal

let g:jsx_ext_required = 0


nmap <C-T> :FZF<CR>

" buffer managent
nmap <C-Q> :q<CR>
" nmap <C-W> :bdelete<CR>
" persistent buffers
" 'set viminfo=%' . &viminfo

" EZ MODE Ctrl+S to save shortcut.
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" i3 like cursor focusing, with alt instead of meta
nmap <silent> <A-j> :wincmd k<CR>
nmap <silent> <A-k> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" CTRL+P to open vim settings
noremap <buffer> <silent> <C-P>          :edit ~/.vimrc<CR>

" https://vim.fandom.com/wiki/Change_vimrc_with_auto_reload
autocmd! BufWritePost .vimrc source %


autocmd FileType markdown  set spell

