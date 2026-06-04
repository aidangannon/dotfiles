vim.api.nvim_create_user_command("Pyright",
    function ()
        local files = vim.fn.systemlist("pyright | grep '\\.py$'")
        local qflist = {}

        for _, file in ipairs(files) do
            table.insert(qflist, {filename = file, lnum = 1})
        end
        vim.fn.setqflist(qflist)
        vim.cmd('copen')
    end, {}
)

vim.api.nvim_create_user_command("RuffFormat",
    function()
        vim.lsp.buf.format({ name = "ruff", async = false })
    end, {}
)

vim.api.nvim_create_user_command("Ruff",
    function ()
        local files = vim.fn.systemlist("ruff check --output-format=concise . | cut -d: -f1 | sort -u")
        local qflist = {}

        for _, file in ipairs(files) do
            table.insert(qflist, {filename = file, lnum = 1})
        end
        vim.fn.setqflist(qflist)
        vim.cmd('copen')
    end, {}
)
