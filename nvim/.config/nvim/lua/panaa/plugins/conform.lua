return {
    {
        "stevearc/conform.nvim",
        keys = {
            {
                -- Customize or remove this keymap to your liking
                "<leader>f",
                function()
                    require("conform").format({ async = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        opts = { -- Set default options
            default_format_opts = {
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                terraform = { "terraform_fmt " },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },
    },
}
