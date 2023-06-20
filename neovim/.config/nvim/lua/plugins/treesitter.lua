return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      local treesitter_configs = require("nvim-treesitter.configs")

      treesitter_configs.setup {
        ensure_installed = { "arduino", "awk", "bash", "bibtex", "c", "c_sharp", "clojure", "cmake", "comment",
          "commonlisp", "cpp", "css", "dart", "devicetree", "diff", "dockerfile", "dot", "eex", "elixir", "elm",
          "erlang", "fish", "fortran", "gdscript", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
          "go", "godot_resource", "gomod", "gosum", "gowork", "graphql", "haskell", "hcl", "html", "htmldjango", "http",
          "ini", "java", "javascript", "jq", "jsdoc", "json", "json5", "jsonc", "julia", "kdl", "kotlin", "latex",
          "llvm", "lua", "luadoc", "luap", "luau", "make", "markdown", "markdown_inline", "matlab", "mermaid", "meson",
          "ninja", "nix", "norg", "objc", "ocaml", "ocaml_interface", "org", "pascal", "passwd", "perl", "php", "phpdoc",
          "prisma", "proto", "pug", "python", "query", "r", "racket", "regex", "rst", "ruby", "rust", "scala", "scheme",
          "scss", "sparql", "sql", "svelte", "sxhkdrc", "terraform", "tlaplus", "todotxt", "toml", "tsx", "typescript",
          "vala", "vim", "vimdoc", "vue", "yaml", "zig",
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },                                       -- See windwp/nvim-ts-autotag
        context_commentstring = { enable = true, enable_autocmd = false }, -- See nvim-ts-context-commentstring
      }
    end,
  },
  { "nvim-treesitter/completion-treesitter", dependencies = { "nvim-treesitter/nvim-treesitter" } },
}
