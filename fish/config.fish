fish_user_key_bindings

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.local/cache
set -gx XDG_RUNTIME_HOME $HOME/.local/runtime

set -gx CARGO_HOME $XDG_CONFIG_HOME/cargo
set -gx RUSTUP_HOME $XDG_CONFIG_HOME/rustup
set -gx BAT_CONFIG_PATH $XDG_CONFIG_HOME/bat/bat.conf

set -gx NVM_DIR $XDG_CONFIG_HOME/nvm
set -gx NPM_CONFIG_PREFIX $XDG_CONFIG_HOME/npm
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/.npmrc
set -gx NPM_CONFIG_CACHE $XDG_CONFIG_HOME/npm

set -gx PATH $CARGO_HOME/bin:$HOME/apps/nvim/bin:$NPM_CONFIG_PREFIX/bin $PATH
