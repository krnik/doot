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
nnoremap <Leader>fb :Buffer<CR>
nnoremap <Leader>fr :Rg<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fg :BCommits<CR>
nnoremap <Leader>fh :Helptags<CR>

nnoremap <Leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>lk <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>lf <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <Leader>lr <cmd>lua vim.lsp.buf.rename()<CR>

"-----------------------" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files'

