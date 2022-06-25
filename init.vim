call plug#begin('~/.config/nvim/plugged')

" themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

Plug 'sheerun/vim-polyglot'

Plug 'jlcrochet/vim-cs'

Plug 'ekalinin/dockerfile.vim'

" Status line
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'

" File System explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" intellisense 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" systax highlight
Plug 'yuezk/vim-js'
Plug 'MaxMellon/vim-jsx-pretty'

Plug 'OmniSharp/omnisharp-vim'
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()

syntax on
set termguicolors

" default setting
set termguicolors
let g:Hexokinase_highlighters = ['backgroundfull']
set number
set backspace=2                         " Backspace deletes like most programs in insert mode
set tabstop=2
set shiftwidth=2
set hidden
set pumheight=10                        " Makes popup menu smaller
set ruler              			            " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages can be 2
set wrap                                " Display long lines as just one
set textwidth=80
set linebreak                            " wrap long lines at a character in 'breakat' rather
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion default 500ms
set timeoutlen=30000                      " By default timeoutlen is 1000 ms, popup poppup
" set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set lazyredraw				                  " Avoids updating the screen before commands are completed
" set cursorline                          " Enable highlighting of the current line
set showtabline=2                       " Always show tabs
" set backspace=indent,eol,start          " Fix backspace indent
set mouse=a  				                    " Enable your mouse
set mousemodel=popup_setpos
" Use modeline overrides
" set modeline
" set modelines=10

" set notitle
set noerrorbells
set noswapfile
" set colorcolumn=120 
" hi ColorColumn ctermbg=0 guibg=black

" highlight clear SignColumn
" hi Pmenu guibg=#3d3d3d gui=NONE
" hi PmenuSel guibg=#232323 gui=NONE
" hi PmenuSbar guibg=#bcbcbc
" hi PmenuThumb guibg=#585858
set buflisted
" Encoding
set encoding=utf-8
set fileencoding=utf-8                  " The encoding written to file
set fileencodings=utf-8

" Searching
set ignorecase                            " ignore Upper or Lowercase
set smartcase                             " depend of pattern lower or Upper
" set hlsearch                              " hightlight search \
" set incsearch                             " set increment next search result
" https://vimhelp.org/options.txt.html#%27statusline%27
set tabline=%f\ \|\ %L
set undofile      " Maintain undo history between sessions
set undodir=~/.config/nvim/undodir
" set mouse cursor block when insert mode"
" set guicursor=i:block  
"
colorscheme onedark

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" Leader Mapping
map <Space> <leader>
" Toggle NerdTree
map <leader>n :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>

nnoremap <silent><F2> :NERDTreeFind<CR>
nnoremap <silent><F3> :NERDTreeToggle<CR>

" CtrlP starting Directory 
let g:ctrlp_working_path_mode = 'ra'
" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/bundle/*,*/node_modules/



" Tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap cp yap}p
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Load
"
" execute 'source '.'path'
execute 'source ~/.config/nvim/settings/coc.vim'

nmap <C-m> <Plug>MarkdownPreview

" Open files in git repo 
nnoremap <silent><leader>p :GFiles --cached --others --exclude-standard<CR>
" Open files in current folder
nnoremap <silent><leader>o :Files<CR>
" Open list of buffers (window open)
nnoremap <silent><leader>b :Buffers<CR>

nnoremap <silent><leader>g :Rg<CR>

inoremap jk <ESC>

nmap <C-j> <down>
nmap <C-k> <up>

:let g:NERDTreeWinSize=40
" TAB in general mode will move to text buffer
nnoremap <TAB> :bn<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bp<CR>


" format code in block
noremap <silent> <leader>a =ip

" close buffer. Consider to active this due to it will close buffer 
nnoremap <silent><leader>q :bd<cr>

" Open list of Files History
nnoremap <silent><leader>i :History<CR>
" Open list of Commands History
nnoremap <silent><leader>y :History:<CR>
