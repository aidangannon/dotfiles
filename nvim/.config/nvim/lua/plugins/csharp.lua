local function c_sharp_setup_cmd()
    vim.api.nvim_create_user_command("CSharpSetup", function()
        vim.cmd("MasonInstall roslyn csharpier")
    end, { desc = "Install C# tools" })
end

c_sharp_setup_cmd()

return {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
        filewatching = "roslyn"
    },
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
        ["csharp|background_analysis"] = {
            dotnet_compiler_diagnostics_scope = "fullSolution",
            dotnet_analyzer_diagnostics_scope = "fullSolution",
        },
    },
    config = function(_, opts)
        require("roslyn").setup(opts)

        vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "InsertLeave"}, {
            pattern = "*.cs",
            callback = function(ev)
                vim.lsp.buf.document_highlight()
            end
        })
    end
}
