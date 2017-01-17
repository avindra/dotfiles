syntax on
set number
set relativenumber
set backspace=indent,eol,start


" Vim plugins
call plug#begin('~/.vim/plugged')


Plug 'vim-syntastic/syntastic'
Plug 'mxw/vim-jsx'
Plug 'ruanyl/vim-fixmyjs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

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
