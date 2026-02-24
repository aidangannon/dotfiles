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

vim.api.nvim_create_user_command("DotnetBuild",
    function ()
        local files = vim.fn.systemlist("dotnet build -clp:ErrorsOnly")

        vim.fn.setqflist({}, ' ', {
            title = "dotnet build",
            lines = files,
            efm = "%f(%l\\,%c): %m"
        })

        vim.cmd('copen')
    end, {}
)
