local settings = require('settings')
require('plugins')
require('lsp')
require('nvim-treesitter.configs').setup({
    highlight = { enable = true },
    indent = { enable = true },
})

return {
    toggle = {
        background = function ()
            settings.toggle('o', 'background', 'dark', 'light')
        end,
    },
}
