function ftplugin#dirvish#RenameFile ()
    if !isdirectory(expand('%'))
        return
    endif

    let path = getline('.')
    let new = input('Rename to: ', path)
    if (path == new) || (new == '')
        return
    endif

    call rename(path, new)
    execute 'Dirvish %'
endfunction

function ftplugin#dirvish#CreatePath ()
    if !isdirectory(expand('%'))
        return
    endif

    let path = input('New child: ', expand('%'))
    if path == ''
        return
    endif

    let last = path[len(path) - 1]
    if last == '/'
        silent execute '! mkdir -p ' . path
    else
        silent execute '! touch ' . path    
    endif

    execute 'Dirvish %'
endfunction

function ftplugin#dirvish#RemovePath()
    if input('Remove [' . getline('.') . '] y/n?') == 'y'
        silent execute '! rm -rf ' . getline('.')
        execute 'Dirvish %'
    endif
endfunction

