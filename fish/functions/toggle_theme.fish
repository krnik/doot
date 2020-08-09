function toggle_theme
    if not set -q fish_color_theme_is_dark
        set -g fish_color_theme_is_dark 1
    end

    if test $fish_color_theme_is_dark = 1
        set -U fish_color_normal normal
        set -U fish_color_command 99cc99
        set -U fish_color_quote ffcc66
        set -U fish_color_redirection d3d0c8
        set -U fish_color_end cc99cc
        set -U fish_color_error f2777a
        set -U fish_color_param d3d0c8
        set -U fish_color_comment ffcc66
        set -U fish_color_match 6699cc
        set -U fish_color_selection white --bold --background=brblack
        set -U fish_color_search_match bryellow --background=brblack
        set -U fish_color_history_current --bold
        set -U fish_color_operator 6699cc
        set -U fish_color_escape 66cccc
        set -U fish_color_cwd green
        set -U fish_color_cwd_root red
        set -U fish_color_valid_path --underline
        set -U fish_color_autosuggestion 747369
        set -U fish_color_user brgreen
        set -U fish_color_host normal
        set -U fish_color_cancel -r
        set -U fish_pager_color_completion normal
        set -U fish_pager_color_description B3A06D yellow
        set -U fish_pager_color_prefix white --bold --underline
        set -U fish_pager_color_progress brwhite --background=cyan

        set -g fish_color_theme_is_dark 0
        theme_gruvbox dark medium
    else
        set -U fish_color_normal normal
        set -U fish_color_command a1b56c
        set -U fish_color_quote f7ca88
        set -U fish_color_redirection 383838
        set -U fish_color_end ba8baf
        set -U fish_color_error ab4642
        set -U fish_color_param 383838
        set -U fish_color_comment f7ca88
        set -U fish_color_match 7cafc2
        set -U fish_color_selection white --bold --background=brblack
        set -U fish_color_search_match bryellow --background=brblack
        set -U fish_color_history_current --bold
        set -U fish_color_operator 7cafc2
        set -U fish_color_escape 86c1b9
        set -U fish_color_cwd green
        set -U fish_color_cwd_root red
        set -U fish_color_valid_path --underline
        set -U fish_color_autosuggestion b8b8b8
        set -U fish_color_user brgreen
        set -U fish_color_host normal
        set -U fish_color_cancel -r
        set -U fish_pager_color_completion normal
        set -U fish_pager_color_description B3A06D yellow
        set -U fish_pager_color_prefix white --bold --underline
        set -U fish_pager_color_progress brwhite --background=cyan

        set -g fish_color_theme_is_dark 1
        theme_gruvbox light medium
    end
end
