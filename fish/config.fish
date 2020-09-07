if set -q BAT_THEME
    switch $BAT_THEME
        case 'gruvbox'
            fish_theme set dark
            set -g fish_color_theme_is_dark 1
        case 'gruvbox-light'
            fish_theme set light
            set -g fish_color_theme_is_dark 0
    end
else
    fish_theme set dark
    set -g fish_color_theme_is_dark 1
    set -x BAT_THEME gruvbox
end

if set -q WT_SESSION
    set -x COLORTERM truecolor
end

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.local/cache
set -x XDG_RUNTIME_HOME $HOME/.local/runtime

set -x CARGO_HOME $XDG_CONFIG_HOME/cargo
set -x RUSTUP_HOME $XDG_CONFIG_HOME/rustup

set -x NVM_DIR $XDG_CONFIG_HOME/nvm
set -x NPM_CONFIG_PREFIX $XDG_CONFIG_HOME/npm
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/.npmrc
set -x NPM_CONFIG_CACHE $XDG_CONFIG_HOME/npm

set -x PATH $CARGO_HOME/bin:$HOME/apps/nvim/bin:$NPM_CONFIG_PREFIX/bin $PATH
