call plug#begin('~/.vim/plugged')
    " NERDTree
    Plug 'preservim/nerdtree'

    " FZF fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

set number relativenumber

" NERDTree
map <C-n> :NERDTreeToggle<CR>

