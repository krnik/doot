local function set_option (scope, name, value)
    vim[scope][name] = value
end

local function set_wo (name, value)
    set_option('wo', name, value)
    set_option('o', name, value)
end

local function set_bo (name, value)
    set_option('bo', name, value)
    set_option('o', name, value)
end

local function set_o (name, value)
    set_option('o', name, value)
end

set_o('hidden', true)
set_o('showmode', true)
set_o('splitbelow', true)
set_o('splitright', true)
set_o('scrolloff', 10)
set_o('termguicolors', true)
set_o('laststatus', 2)
set_o('lazyredraw', true)
set_o('listchars', 'eol:$,tab:>-<,space:·')
set_o('ignorecase', true)
set_o('timeoutlen', 600)
set_o('pyxversion', 3)
set_o('undofile', true)
set_o('undolevels', 100)
set_o('smartcase', true)
set_o('statusline', '%-5([#%n] [%c%V:%l %L]%)%< %f%=%m%r%h%w%y%#StatusLineNC#')
set_o('mouse', 'n')

set_wo('number', true)
set_wo('relativenumber', true)
set_wo('foldcolumn', 'auto:4')
set_wo('foldminlines', 4)
set_wo('foldnestmax', 4)
set_wo('signcolumn', 'yes')

set_bo('tabstop', 4)
set_bo('shiftwidth', 4)
set_bo('expandtab', true)

if os.getenv('BAT_THEME') == 'gruvbox-light' then
    vim.o.background = 'light'
end

return {
    toggle = function (scope, name, left, right)
        local nextval

        if vim[scope][name] == left then
            nextval = right
        else
            nextval = left
        end

        vim[scope][name] = nextval
        if scope ~= 'o' then
            vim.o[name] = nextval
        end
    end,
}
