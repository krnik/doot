function fish_mode_prompt --description 'Displays the current mode'
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        set_color --bold 666
        printf "%s " (string repeat -n $SHLVL ">")
        switch $fish_bind_mode
            case default
                echo N
            case insert
                echo I
            case replace_one
                echo R
            case visual
                echo V
        end
        set_color normal
        printf " "
    end
end

