syntax on
set number
set relativenumber
set backspace=indent,eol,start

" Paste to and from system clipboard
set clipboard+=unnamedplus


" Vim plugins
call plug#begin('~/.local/share/nvim/plugged')


Plug 'vim-syntastic/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'mxw/vim-jsx'
Plug 'ruanyl/vim-fixmyjs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'

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

if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif
