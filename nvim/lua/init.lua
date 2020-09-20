local options = {
    toggle_foldcolumn = function ()
        if vim.wo.foldcolumn == '0' then
            vim.wo.foldcolumn = '4'
        else
            vim.wo.foldcolumn = '0'
        end
    end,
    toggle_background = function ()
        if vim.o.background == 'dark' then
            vim.o.background = 'light'
        else
            vim.o.background = 'dark'
        end
    end,
}

return {
    options = options,
}
