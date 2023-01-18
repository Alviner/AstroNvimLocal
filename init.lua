-- AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
        colorscheme = "catppuccin",
        header = {
                "",
                "    ███    ██ ██    ██ ██ ███    ███",
                "    ████   ██ ██    ██ ██ ████  ████",
                "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
                "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
                "    ██   ████   ████   ██ ██      ██",
        },

        -- Default theme configuration
        default_theme = {
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = true,
                        indent_blankline = true,
                        lightspeed = true,
                        ["neo-tree"] = true,
                        notify = true,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = true,
                        telescope = true,
                        treesitter = true,
                        vimwiki = false,
                        ["which-key"] = true,
                },
        },
        plugins = {
                init = {
                        ["catppuccin/nvim"] = { as = "catppuccin" },
                        ["phaazon/hop.nvim"] = {
                                as = "hop",
                                branch = "v2",
                                config = function() require("hop").setup { keys = "etovxqpdygfblzhckisuran" } end,
                        },
                        ["mfussenegger/nvim-dap-python"] = {
                                config = function()
                                        require("dap-python").test_runner = "pytest"
                                        require("dap-python").resolve_python = function()
                                                print "resolve"
                                                return "python"
                                        end
                                        require("dap-python").setup "python"
                                end,
                                after = { "nvim-dap" },
                        },
                },
                treesitter = { -- overrides `require("treesitter").setup(...)`
                        ensure_installed = { "lua", "python", "go", "vue", "javascript", "yaml", "json", "css", "hcl" },
                },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        ensure_installed = {
                                "sumneko_lua",
                                "gopls",
                                "clangd",
                                "html",
                                "jsonls",
                                "cssls",
                                "dockerls",
                                "marksman",
                                "terraformls",
                                "vuels",
                                "yamlls",
                        },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        ensure_installed = { "prettier", "stylua", "clang_format", "jq", "markdownlint", "mypy", "vimt" },
                },
                ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
                        ensure_installed = { "python", "go" },
                },
                dapui = function(config) -- parameter is the default setup config table
                        local dap = require "dap"
                        dap.listeners.before.event_terminated["dapui_config"] = nil
                        dap.listeners.before.event_exited["dapui_config"] = nil

                        return config
                end,
        },
}

return config
