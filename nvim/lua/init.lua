require('plugins')
require('lsp')
require('nvim-treesitter.configs').setup({
    highlight = { enable = true },
    indent = { enable = true },
})

local toggle_config = function (scope, name, left, right)
	if vim[scope][name] == left then
	    vim[scope][name] = right
	else
	    vim[scope][name] = left
	end
end

return {
    toggle = {
        background = function ()
            toggle_config('o', 'background', 'dark', 'light')
        end,
    },
}
