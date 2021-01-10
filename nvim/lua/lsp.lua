local utils = require('utils')
local sumneko_root_path = vim.fn.stdpath('cache') .. '/lspconfig/lua-language-server'

local get_sumneko_bin_path = function ()
    local system_directory

    if vim.fn.has("mac") == 1 then
        system_directory = "macOS"
    elseif vim.fn.has("unix") == 1 then
        system_directory = "Linux"
    elseif vim.fn.has('win32') == 1 then
        system_directory = "Windows"
    else
        print("Unsupported system for sumneko")
        return nil
    end

    return sumneko_root_path .. '/bin/' .. system_directory .. '/lua-language-server'
end

utils.ensure_dir_exists_or_else(
    sumneko_root_path,
    function ()
        local build
        local rebuild = './3rd/luamake/luamake rebuild'

        if vim.fn.has("mac") == 1 then
            build = 'ninja -f ninja/macos.ninja'
        elseif vim.fn.has("unix") == 1 then
            build = 'ninja -f ninja/linux.ninja'
        elseif vim.fn.has('win32') == 1 then
            build = 'tools\\ninja.exe -f ninja\\msvc.ninja'
            rebuild = '3rd\\luamake\\luamake.exe rebuild'
        else
            print("Unsupported system for sumneko")
            return
        end

        local update_submodules = 'cd ' .. sumneko_root_path .. ' && git submodule update --init --recursive'
        local build_lsp_server = 'cd ' .. sumneko_root_path .. '/3rd/luamake && ' .. build .. ' && cd ../../ && ' .. rebuild

        vim.api.nvim_command('!git clone https://github.com/sumneko/lua-language-server ' .. sumneko_root_path)
        vim.api.nvim_command('!' .. update_submodules .. ' && ' .. build_lsp_server)
    end,
    function ()
        return utils.prompt_yn('Lua LSP not found, do you want to install it now?')
    end
)

local lsp = require('lspconfig')

lsp.tsserver.setup({})
lsp.rust_analyzer.setup({})
lsp.sumneko_lua.setup({
    cmd = { get_sumneko_bin_path(), '-E', sumneko_root_path .. '/main.lua' },
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
