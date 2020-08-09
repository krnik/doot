"-----------------------" DIR SETUP
function! s:setup_directories ()
  let root = getenv('XDG_CONFIG_HOME')

  if root == v:null
    echo 'No XDG_CONFIG_HOME env variable set!'
    let root = getenv('HOME')
  endif
        
  let root .= '/nvim'

  let dirs = { 'root ': root , 'backup': root . '/backup', 'undo': root . '/undo', 'swap': root . '/swap', 'plug': root . '/plug-data' }

  for dir in values(dirs)
    if !isdirectory(dir)
      call mkdir(dir)
    endif
  endfor

  return dirs
endfunction

let s:dirs = s:setup_directories()

"-----------------------" UTILS
function! ToggleBackground ()
  if &background == 'dark'
    set background=light
  else
    set background=dark
  endif
endfunction

"-----------------------" BACKING UP
set backup
set undofile
set undolevels=500
let &backupdir=s:dirs.backup
let &directory=s:dirs.swap
let &undodir=s:dirs.undo
set pyx=3

filetype plugin indent on

"-----------------------" PLUGINS
call plug#begin(s:dirs.plug)

Plug 'tpope/vim-sleuth'
Plug 'takac/vim-hardtime'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': './install' }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox'

Plug 'leafgarland/typescript-vim'
Plug 'cespare/vim-toml'
Plug 'jparise/vim-graphql'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'weirongxu/coc-explorer', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', { 'do': 'yarn install --frozen-lockfile'}

call plug#end()

"-----------------------" USER CONFIG
syntax enable
set updatetime=500
set timeoutlen=600
colorscheme gruvbox

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set showcmd
set nocursorline
set nocursorcolumn
set scrolloff=10
set hidden
set termguicolors
set splitright
set splitbelow
set showmode
set showtabline=0
set signcolumn=yes
set laststatus=2
set cmdheight=1
set wildmenu
set wildmode=full
set lazyredraw
set showmatch
set matchtime=3
set shortmess+=c

set foldenable
set foldmethod=manual
set foldlevelstart=8

set incsearch
set hlsearch
set ignorecase
set smartcase

set statusline=
set statusline+=%-5([#%n]\ [%c%V:%l\ %L]%)%<
set statusline+=\ %f%=
set statusline+=%m%r%h%w%y
set statusline+=%#StatusLineNC#

set listchars=eol:$,tab:>·<,space:·
set nolist

"-----------------------" MAPPINGS
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
let mapleader= " "

" has('wsl') does not work
if system('uname -r') =~ 'microsoft'
  augroup Yank
    autocmd!
    autocmd TextYankPost \* :call system('clip.exe ',@")
  augroup END
endif

nnoremap <Leader>y "*Y
vnoremap <Leader>y "*y
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>P "*P
inoremap <C-l> <Del>
cnoremap <C-l> <Del>

cnoremap <M-h> <Left>
cnoremap <M-S-h> <S-Left>
cnoremap <M-j> <Down>
cnoremap <M-k> <Up>
cnoremap <M-l> <Right>
cnoremap <M-S-l> <S-Right>

nnoremap <Leader>q :close<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :CocCommand explorer<CR>
nnoremap <Leader>vi :edit $MYVIMRC<CR>
nnoremap <Leader>x :let @/ = ''<CR>
nnoremap <Leader>vw :set list!<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>
nnoremap <Leader>vb :call ToggleBackground()<CR>

nnoremap <Leader>ff :FZF<CR>
nnoremap <Leader>fb :Buffer<CR>
nnoremap <Leader>fr :Rg<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fg :BCommits<CR>
nnoremap <Leader>fh :Helptags<CR>

"-----------------------" HARDTIME
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 5

"-----------------------" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files'

"-----------------------" COC:COMPLETION
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <C-Space> coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <Leader>rn	<Plug>(coc-rename)
nmap <Leader>rq <Plug>(coc-fix-current)
nmap <Leader>rf :call CocAction('format')<CR>
