"-----------------------" USER CONFIG
filetype plugin indent on
lua init = require('init')
colorscheme gruvbox

"-----------------------" MAPPINGS
let mapleader= " "

nnoremap <Space> <Nop>
vnoremap <Space> <Nop>

cnoremap <M-h> <Left>
cnoremap <M-S-h> <S-Left>
cnoremap <M-l> <Right>
cnoremap <M-S-l> <S-Right>
cnoremap <M-j> <Down>
cnoremap <M-k> <Up>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :let @/ = ''<CR>

nnoremap <Leader>y "*Y
vnoremap <Leader>y "*y
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>P "*P

nnoremap <Leader>vi :edit $MYVIMRC<CR>
nnoremap <Leader>vw :set list!<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>
nnoremap <Leader>vb :lua init.toggle.background()<CR>

nnoremap <Leader>ff :FZF<CR>
nnoremap <Leader>fd :GFiles<CR>
nnoremap <Leader>fs :GFiles?<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fr :Rg<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>f; :History:<CR>
nnoremap <Leader>f: :Commands<CR>
nnoremap <Leader>fc :Commits<CR>
nnoremap <Leader>fv :BCommits<CR>
nnoremap <Leader>fh :Helptags<CR>
nnoremap <Leader>fm :Maps<CR>
nnoremap <Leader>f' :Marks<CR>

nnoremap <Leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>lk <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>lf <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <Leader>lr <cmd>lua vim.lsp.buf.rename()<CR>

"-----------------------" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

set hidden
set showmode
set splitbelow
set splitright
set scrolloff=10
set termguicolors
set laststatus=2
set lazyredraw
set ignorecase
set listchars=eol:$,tab:>-<,space:·
set timeoutlen=600
set pyxversion=3
set undofile
set undolevels=100
set statusline=%-5([#%n]\ [%c%V:%l\ %L]%)%<\ %f%=%m%r%h%w%y%#StatusLineNC#
set mouse=n

set number
set relativenumber
set foldcolumn=auto:4
set foldminlines=4
set foldnestmax=4
set signcolumn=yes

set tabstop=4
set shiftwidth=4
set expandtab

if $BAT_THEME == 'gruvbox-light'
    set background=light
endif
