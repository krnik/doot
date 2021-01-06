local function set_setting (scope)
    return function (name, value)
        vim[scope][name] = value
    end
end

local function toggle_setting (scope)
    return function (name, from, to)
        if vim[scope][name] == from then
            vim[scope][name] = to
        else
            vim[scope][name] = from
        end
    end
end

local function setting_methods (scope)
    return {
        set = set_setting(scope),
        toggle = toggle_setting(scope),
    }
end

local settings = {
    buf = setting_methods('bo'),
    win = setting_methods('wo'),
    global = setting_methods('o'),
}

-- Glboal options
settings.global.set('hidden', true)
settings.global.set('showmode', true)
settings.global.set('splitbelow', true)
settings.global.set('splitright', true)
settings.global.set('scrolloff', 10)
settings.global.set('termguicolors', true)
settings.global.set('laststatus', 2)
settings.global.set('lazyredraw', true)
settings.global.set('ignorecase', true)
settings.global.set('listchars', 'eol:$,tab:>·<,space:·')
settings.global.set('timeoutlen', 600)
settings.global.set('pyxversion', 3)
settings.global.set('undofile', true)
settings.global.set('undolevels', 100)
settings.global.set('statusline', '%-5([#%n] [%c%V:%l %L]%)%< %f%=%m%r%h%w%y%#StatusLineNC#')
settings.global.set('mouse', 'n')

-- Window options
settings.win.set('number', true)
settings.win.set('relativenumber', true)
settings.win.set('foldcolumn', 'auto:4')
settings.win.set('foldminlines', 4)
settings.win.set('foldnestmax', 4)
settings.win.set('signcolumn', 'yes')

-- Buffer options
settings.buf.set('tabstop', 4)
settings.buf.set('shiftwidth', 4)
settings.buf.set('expandtab', true)

-- If BAT_THEME env variable is set to "gruvbox-light" then
-- set the vim background to light.
if os.getenv('BAT_THEME') == 'gruvbox-light' then
    settings.global.set('background', 'light')
end

return settings
