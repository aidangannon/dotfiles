local snacks_keymaps = {
    { "<leader>ff", function() require("fzf-lua").files() end },
    { "<leader>fg", function() require("fzf-lua").live_grep() end },
    { "<leader>fs", function() require("fzf-lua").lsp_document_symbols() end },
    { "<leader>fS", function() require("fzf-lua").lsp_workspace_symbols() end },
}

local function nvim_tree_keymaps()
    vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
    vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>")
end

local function on_nvim_tree_attach(bufnr)
    local api = require("nvim-tree.api")
    api.config.mappings.default_on_attach(bufnr)
end

nvim_tree_keymaps()

return {
    lsp = {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-tree.lua",
        },
        config = function()
            require("lsp-file-operations").setup()
        end
    },
    files = {
        "ibhagwan/fzf-lua",
        cmd = "Fzflua",
        keys = snacks_keymaps
    },
    explorer = {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "folke/snacks.nvim" },
        config = function()
            require("nvim-tree").setup({
                on_attach = on_nvim_tree_attach,
                filters = {
                    dotfiles = false,
                    git_ignored = false,
                },
                renderer = {
                    full_name = true,
                },
                view = {
                    width = 30,
                    number = true,
                    relativenumber = true
                },
            })

            local Event = require("nvim-tree.api").events
            Event.subscribe(Event.Event.NodeRenamed, function()
                vim.defer_fn(function()
                    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                        if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].modified then
                            vim.api.nvim_buf_call(bufnr, function()
                                vim.cmd("silent! write")
                            end)
                        end
                    end
                end, 200)
            end)
        end
    }
}
