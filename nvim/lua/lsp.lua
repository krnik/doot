local lua_system_dir

if vim.fn.has("mac") == 1 then
  lua_system_dir = "macOS"
elseif vim.fn.has("unix") == 1 then
  lua_system_dir = "Linux"
elseif vim.fn.has('win32') == 1 then
  lua_system_dir = "Windows"
else
  print("Unsupported system for sumneko")
end

-- Install the sumneko/lua-language-server inside cache/lspconfig
local sumneko_root_path = vim.fn.stdpath('cache') .. '/lspconfig/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. lua_system_dir .. '/lua-language-server'

require('lspconfig').tsserver.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').sumneko_lua.setup({
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                  [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
})
