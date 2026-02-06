-- Check if schema-companion is available
local has_schema_companion, schema_companion = pcall(require, "schema-companion")

if has_schema_companion then
  -- Use schema-companion integration
  return schema_companion.setup_client(
    schema_companion.adapters.yamlls.setup({
      sources = {
        -- Kubernetes schema matcher
        schema_companion.sources.matchers.kubernetes.setup({
          version = "master"
        }),
        -- Use schemas from LSP
        schema_companion.sources.lsp.setup(),
        -- Additional static schemas
        schema_companion.sources.schemas.setup({
          {
            name = "GitHub Workflow",
            uri = "https://json.schemastore.org/github-workflow.json",
          },
          {
            name = "GitHub Action",
            uri = "https://json.schemastore.org/github-action.json",
          },
          {
            name = "Docker Compose",
            uri = "https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json",
          },
        }),
      },
    }),
    {
      cmd = { 'yaml-language-server', '--stdio' },
      filetypes = { 'yaml', 'yml' },
      root_markers = { '.git', '.yamlls-root' },
      single_file_support = true,

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
            singleQuote = false,
            bracketSpacing = true,
          },
          customTags = {
            "!Base64",
            "!Cidr",
            "!FindInMap sequence",
            "!GetAtt",
            "!GetAZs",
            "!ImportValue",
            "!Join sequence",
            "!Ref",
            "!Select sequence",
            "!Split sequence",
            "!Sub",
            "!tpl",
            "!include",
            "!toYaml",
            "!quote",
            "!b64enc",
            "!b64dec",
            "!env",
            "!file",
            "!readFile",
            "!required",
            "!default",
            "!coalesce",
            "!dict",
            "!list",
            "!get",
            "!set",
            "!unset",
            "!hasKey",
            "!dig",
          },
        },
      },
    }
  )
else
  -- Fallback to default configuration
  return {
    cmd = { 'yaml-language-server', '--stdio' },
    filetypes = { 'yaml', 'yml' },
    root_markers = { '.git', '.yamlls-root' },
    single_file_support = true,

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
          singleQuote = false,
          bracketSpacing = true,
        },
        schemas = {
          kubernetes = {
            "*.k8s.yaml",
            "k8s/*.yaml",
            "kubernetes/*.yaml",
            "*-deployment.yaml",
            "*-service.yaml",
            "*-configmap.yaml",
            "*-secret.yaml",
            "*-ingress.yaml",
          },
          ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.yaml",
          ["https://json.schemastore.org/github-action.json"] = ".github/actions/*/action.yaml",
          ["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "docker-compose*.yaml",
        },
        customTags = {
          "!Base64",
          "!Cidr",
          "!FindInMap sequence",
          "!GetAtt",
          "!GetAZs",
          "!ImportValue",
          "!Join sequence",
          "!Ref",
          "!Select sequence",
          "!Split sequence",
          "!Sub",
          "!tpl",
          "!include",
          "!toYaml",
          "!quote",
          "!b64enc",
          "!b64dec",
          "!env",
          "!file",
          "!readFile",
          "!required",
          "!default",
          "!coalesce",
          "!dict",
          "!list",
          "!get",
          "!set",
          "!unset",
          "!hasKey",
          "!dig",
        },
      },
    },
  }
end
