call plug#begin('~/.vim/plugged')

" Appearance
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Utilities
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'arcticicestudio/nord-vim'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-vetur']

" Git
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/vim-emoji'   
call plug#end()

set t_Co=256
colorscheme nord
filetype plugin indent on
syntax on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode


" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
" set cursorline
set inccommand=split
set mouse=a
set mouse=nicr
set splitbelow splitright
set number
set title
set ttimeoutlen=0
set wildmenu
set hidden  
set noswapfile
set nobackup 
" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

" File browser
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38


let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


" Normal mode remappings
nnoremap <C-q> :q!<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>


" Remap ESC to ii
:imap ii <Esc>

" Auto Commands
augroup auto_commands
    autocmd FileType scss setlocal iskeyword+=@-@
augroup END


