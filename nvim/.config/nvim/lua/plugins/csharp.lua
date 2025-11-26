local function c_sharp_setup_cmd()
    vim.api.nvim_create_user_command("CSharpSetup", function()
        vim.cmd("MasonInstall roslyn csharpier")
    end, { desc = "Install C# tools" })
end

local function auto_start_roslyn_autocmd()
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            local has_sln = vim.fn.glob("*.sln") ~= ""
            local has_csproj = vim.fn.glob("**/*.csproj") ~= ""

            if has_sln or has_csproj then
                vim.cmd("Roslyn start")
            end
        end
    })
end

local function sync_filesys_to_namespace_autocmd()
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.cs",
        callback = function()
            vim.defer_fn(function()
                vim.lsp.buf.code_action({
                    filter = function(action)
                        return action.title:match("namespace") ~= nil
                    end,
                    apply = true,
                })
            end, 300)
        end
    })
end

c_sharp_setup_cmd()
auto_start_roslyn_autocmd()
sync_filesys_to_namespace_autocmd()

return {
    "seblyng/roslyn.nvim",
    ft = { "cs" },
    opts = {}
}
