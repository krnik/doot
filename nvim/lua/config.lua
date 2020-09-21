local function set_config (scope)
    return function (name, value)
        vim[scope][name] = value
    end
end

local function toggle_config (scope)
    return function (name, from, to)
        if vim[scope][name] == from then
            vim[scope][name] = to
        else
            vim[scope][name] = from
        end
    end
end

local function config_methods (scope)
    return {
        set = set_config(scope),
        toggle = toggle_config(scope),
    }
end

local config = {
    buf = config_methods('bo'),
    win = config_methods('wo'),
    global = config_methods('o'),
}

-- Glboal options
config.global.set('hidden', true)
config.global.set('showmode', true)
config.global.set('splitbelow', true)
config.global.set('splitright', true)
config.global.set('scrolloff', 10)
config.global.set('termguicolors', true)
config.global.set('laststatus', 2)
config.global.set('lazyredraw', true)
config.global.set('ignorecase', true)
config.global.set('listchars', 'eol:$,tab:>·<,space:·')
config.global.set('timeoutlen', 600)
config.global.set('pyxversion', 3)
config.global.set('undofile', true)
config.global.set('undolevels', 100)
config.global.set('statusline', '%-5([#%n] [%c%V:%l %L]%)%< %f%=%m%r%h%w%y%#StatusLineNC#')

-- Window options
config.win.set('number', true)
config.win.set('relativenumber', true)
config.win.set('foldcolumn', 'auto:4')
config.win.set('foldminlines', 4)
config.win.set('foldnestmax', 4)
config.win.set('signcolumn', 'yes')

-- Buffer options
config.buf.set('tabstop', 4)
config.buf.set('shiftwidth', 4)
config.buf.set('expandtab', true)

return config
