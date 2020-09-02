function fish_user_key_bindings
    fish_vi_cursor_next --force-iterm
    fish_vi_key_bindings default

    for mode in insert default visual
        # fish-shell/share/functions/__fish_shared_key_bindings.fish cy yank
        bind -M $mode -e \cy
        bind -M $mode \cy forward-char
    end

    set -U fish_cursor_default block
    set -U fish_cursor_insert line
    set -U fish_cursor_replace_one underscore
    set -U fish_cursor_visual block
end

