
" smartcase = use all lowercase for case-insensitive search
set smartcase
set number
set relativenumber
set backspace=indent,eol,start
set nobackup

" Disable help docs
inoremap <F1>      <NOP>
noremap <F1>      <NOP>

nnoremap <F3>      :set hlsearch!<CR>
nnoremap <F5>    :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR> 

filetype plugin on

" Paste from and to system clipboard
set clipboard+=unnamedplus

" luke guides
autocmd FileType tex inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
" luke tex
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i

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
noremap <buffer> <silent> <C-P>          :edit /home/avindra/.config/nvim/init.vim<CR>

if $VIM_CRONTAB == "true"
    set nowritebackup
endif

