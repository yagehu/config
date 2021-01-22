call plug#begin('~/.vim/plugged')
    " NERDTree
    Plug 'preservim/nerdtree'

    " FZF fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Coc for intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Rust
    Plug 'rust-lang/rust.vim'

    " Indent guides
    Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

colorscheme default

let mapleader = " "

set colorcolumn=80
set tabstop=4
set shiftwidth=4
set expandtab
set shiftwidth=4
set number
set cursorline

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" FZF
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>r :Rg<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Rust
let g:rustfmt_autosave = 1

set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" .witx files
autocmd BufRead,BufNewFile *.witx setfiletype witx
autocmd FileType witx setlocal shiftwidth=2 tabstop=2
autocmd FileType witx setlocal foldmethod=indent

" YAML files
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 sts=2 foldmethod=indent expandtab

" WebAssembly text format (wat) files
autocmd FileType wast setlocal shiftwidth=2 tabstop=2 sts=2 expandtab
