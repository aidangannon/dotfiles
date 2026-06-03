vim.diagnostic.config({
    update_in_insert = false,
    virtual_text = true,
    signs = true,
    underline = true,
    severity_sort = true,
})

vim.lsp.set_log_level("OFF")

local function lsp_keymaps()
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = args.buf })
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = args.buf })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })
            vim.keymap.set("n", "<leader>rn", function()
                local params = vim.lsp.util.make_position_params()
                local new_name = vim.fn.input("New name: ", vim.fn.expand("<cword>"))
                if new_name == "" or new_name == vim.fn.expand("<cword>") then return end

                params.newName = new_name
                vim.lsp.buf_request(0, "textDocument/rename", params, function(err, result, ctx)
                    if err then
                        vim.notify("Rename failed: " .. tostring(err), vim.log.levels.ERROR)
                        return
                    end
                    if result then
                        vim.lsp.util.apply_workspace_edit(result, "utf-8")
                        vim.defer_fn(function()
                            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                                if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].modified then
                                    vim.api.nvim_buf_call(bufnr, function()
                                        vim.cmd("silent! write")
                                    end)
                                end
                            end
                        end, 100)
                    end
                end)
            end, { buffer = args.buf, desc = "Rename and save all" })

            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = args.buf })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = args.buf })
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = args.buf })
        end
    })
end

local code_navigation_keys = {
    { "[s", "<cmd>AerialPrev<cr>", desc = "Previous symbol" },
    { "]s", "<cmd>AerialNext<cr>", desc = "Next symbol" },
    { "<leader>a", "<cmd>AerialToggle<cr>", desc = "Toggle aerial outline" }
}

lsp_keymaps()

return {
    navigation = {
        "stevearc/aerial.nvim",
        opts = {},
        keys = code_navigation_keys
    },
    ats = {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({})
            require("nvim-treesitter").install({
                "python",
                "typescript",
                "javascript",
                "lua",
                "hcl",
                "terraform",
                "c_sharp",
            })
        end
    },
    lsp = {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            capabilities.workspace = capabilities.workspace or {}
            capabilities.workspace.didChangeWatchedFiles = capabilities.workspace.didChangeWatchedFiles or {}
            capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "basedpyright",
                    "pylsp",
                    "ruff",
                    "lua_ls",
                    "ts_ls",
                    "terraformls"
                }
            })

            vim.lsp.config("ts_ls", { capabilities = capabilities })
            vim.lsp.config("lua_ls", { capabilities = capabilities })
            vim.lsp.config("basedpyright", {
                capabilities = capabilities,
                settings = {
                    basedpyright = {
                        analysis = {
                            autoImportCompletions = true,
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                        }
                    }
                }
            })
            local pylsp_site_packages = (function()
                local venv = vim.fn.finddir(".venv", vim.fn.getcwd() .. ";")
                if venv == "" then return nil end
                local lib = vim.fn.fnamemodify(venv, ":p") .. "lib"
                local dirs = vim.fn.glob(lib .. "/python*/site-packages", false, true)
                return #dirs > 0 and dirs[1] or nil
            end)()
            vim.lsp.config("pylsp", {
                capabilities = capabilities,
                cmd = pylsp_site_packages
                    and { "env", "PYTHONPATH=" .. pylsp_site_packages, "pylsp" }
                    or { "pylsp" },
                settings = {
                    pylsp = {
                        plugins = {
                            jedi_completion = {
                                enabled = true,
                                include_params = false,
                                fuzzy = false,
                            },
                            rope_autoimport = {
                                enabled = true,
                                memory = true,
                                completions = { enabled = true },
                                code_actions = { enabled = true },
                            },
                            jedi_definition = { enabled = false },
                            jedi_hover = { enabled = false },
                            jedi_references = { enabled = false },
                            jedi_signature_help = { enabled = false },
                            jedi_symbols = { enabled = false },
                            pyflakes = { enabled = true },
                            pycodestyle = { enabled = false },
                            pylint = { enabled = false },
                            mccabe = { enabled = false },
                        },
                    },
                },
            })
            vim.lsp.enable("pylsp")
            vim.lsp.config("ruff", { capabilities = capabilities })
            vim.lsp.config("terraformls", { capabilities = capabilities })
            vim.lsp.config("pytest_lsp",
            {
                capabilities = capabilities,
                cmd = { 'pytest-language-server' },
                filetypes = { 'python' },
                root_markers = { 'pyproject.toml', '.git' }
            })

            vim.lsp.enable("ts_ls")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("basedpyright")
            vim.lsp.enable("ruff")
            vim.lsp.enable("terraformls")
            vim.lsp.enable("pytest_lsp")
        end
    },
    autocomplete = {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            keymap = {
                preset = "default",
                ["<CR>"] = { "accept", "fallback" },
                ["<C-e>"] = { "cancel", "fallback" },
                ["<C-Space>"] = { "show", "fallback" },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lsp = {
                        async = true,
                    },
                    buffer = {
                        opts = {
                            get_bufnrs = function() return vim.api.nvim_list_bufs() end,
                        }
                    }
                }
            },
            completion = {
                ghost_text = { enabled = true },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    }
                },
                menu = {
                    auto_show_delay_ms = 150,
                },
            },
        }
    },
    refactoring = {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = false,
        opts = {},
    }
}
