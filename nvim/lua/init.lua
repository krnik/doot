local config = require('config')

require('nvim_lsp').tsserver.setup({})
require('nvim_lsp').rust_analyzer.setup({})
require('nvim_lsp').sumneko_lua.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

require('nvim-treesitter.configs').setup({ highlight = { enable = true } })

local toggle = {
    background = function ()
        config.global.toggle('background', 'dark', 'light')
    end,
}

return {
    toggle = toggle,
}
