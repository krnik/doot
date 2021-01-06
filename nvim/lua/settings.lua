-- Glboal options
vim.o.hidden = true
vim.o.showmode = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 10
vim.o.termguicolors = true
vim.o.laststatus = 2
vim.o.lazyredraw = true
vim.o.ignorecase = true
vim.o.listchars = 'eol:$,tab:>-<,space:·'
vim.o.timeoutlen = 600
vim.o.pyxversion = 3
vim.o.undofile = true
vim.o.undolevels = 100
vim.o.statusline = '%-5([#%n] [%c%V:%l %L]%)%< %f%=%m%r%h%w%y%#StatusLineNC#'
vim.o.mouse = 'n'

-- Window options
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.foldcolumn = 'auto:4'
vim.wo.foldminlines = 4
vim.wo.foldnestmax = 4
vim.wo.signcolumn = 'yes'

-- Buffer options
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

-- If BAT_THEME env variable is set to "gruvbox-light" then
-- set the vim background to light.
if os.getenv('BAT_THEME') == 'gruvbox-light' then
    vim.o.background = 'light'
end

return {
    toggle = function (scope, name, left, right)
        if vim[scope][name] == left then
            vim[scope][name] = right
        else
            vim[scope][name] = left
        end
    end
}
