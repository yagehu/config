call plug#begin('~/.vim/plugged')
    " NERDTree
    Plug 'preservim/nerdtree'

    " FZF fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Coc for intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set tabstop=4
set shiftwidth=4
set number relativenumber

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" NERDTree
map <C-n> :NERDTreeToggle<CR>

