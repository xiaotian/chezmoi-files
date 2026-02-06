return {
    'someone-stole-my-name/yaml-companion.nvim',
    ft = { "yaml", "yml" },
    dependencies = {
        'neovim/nvim-lspconfig',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require("yaml-companion").setup({
            builtin_matchers = {
                kubernetes = { enabled = true },
            },
            schemas = {
                {
                    name = "Kubernetes 1.30",
                    uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/all.json",
                },
                {
                    name = "Kubernetes 1.29",
                    uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/all.json",
                },
                {
                    name = "Kubernetes 1.28",
                    uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.28.0-standalone-strict/all.json",
                },
            },
            lspconfig = {
                settings = {
                    yaml = {
                        validate = true,
                        hover = true,
                        completion = true,
                        schemaStore = {
                            enable = true,
                            url = "https://www.schemastore.org/api/json/catalog.json",
                        },
                        format = {
                            enable = true,
                        },
                    },
                },
            },
        })
        require("telescope").load_extension("yaml_schema")

        -- Add keybinding to select schema
        vim.keymap.set("n", "<leader>ys", "<cmd>Telescope yaml_schema<cr>", { desc = "Select YAML schema" })
    end
}
