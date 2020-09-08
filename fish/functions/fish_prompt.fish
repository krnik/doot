function fish_prompt --description 'Write out the prompt'
    echo -n -s ' ' (set_color normal) (string repeat -n $SHLVL '>') ' ' (prompt_pwd) ' $ '
end

