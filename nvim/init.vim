"-----------------------" DIR SETUP
function s:setup_directories ()
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
function ToggleFoldcolumn()
    if &l:foldcolumn == 0
        setl foldcolumn=4
    else
        setl foldcolumn=0
    endif
endfunction

function ToggleBackground ()
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

"-----------------------"
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'

"-----------------------"
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-dirvish'

Plug 'morhetz/gruvbox'

"-----------------------"
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'

"-----------------------"
Plug 'dag/vim-fish'
Plug 'jparise/vim-graphql'

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
set foldopen=percent
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

nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :Dirvish %<CR>
nnoremap <Leader>vi :edit $MYVIMRC<CR>
nnoremap <Leader>x :let @/ = ''<CR>
nnoremap <Leader>vw :set list!<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>
nnoremap <Leader>vb :call ToggleBackground()<CR>
nnoremap <Leader>vf :call ToggleFoldcolumn()<CR>

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

"-----------------------"
lua require'nvim_lsp'.tsserver.setup{}
lua require'nvim_lsp'.sumneko_lua.setup{}
lua require'init'

"-----------------------"
function RenameFile ()
    if !isdirectory(expand('%'))
        return
    endif

    let path = getline('.')
    let new = input('Rename to: ', path)

    if (path == new) || (new == '')
        return
    endif

    call rename(path, new)
    execute 'Dirvish %'
endfunction

augroup dirvish_config
    autocmd FileType dirvish nnoremap <buffer> r :call RenameFile()<CR>
augroup END

