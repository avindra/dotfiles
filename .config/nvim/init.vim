
set number
set relativenumber
set backspace=indent,eol,start

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
call plug#begin('~/.local/share/nvim/plugged')


Plug 'vim-syntastic/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'mxw/vim-jsx'
Plug 'ruanyl/vim-fixmyjs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()


let g:jsx_ext_required = 0


" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": ["javascript"],
        \ "passive_filetypes": ["puppet"] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

nmap <C-T> :FZF<CR>

" buffer managent
nmap <C-Q> :q<CR>
nmap <C-W> :bdelete<CR>
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
    set nobackup
    set nowritebackup
endif

