require('plugins')
require('lsp')
require('nvim-treesitter.configs').setup({
    highlight = { enable = true },
    indent = { enable = true },
})

local settings = require('settings')

return {
    toggle = {
        background = function ()
            settings.global.toggle('background', 'dark', 'light')
        end,
    },
}
