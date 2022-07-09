local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
  ensure_installed = { "javascript", "c", "embedded_template", "clojure", "cpp", "cuda", "dockerfile", "dot", "rust", "lua", "python", "go", "gomod", "gowork", "graphql", "ruby", "perl", "bash", "fish", "php", "java", "kotlin", "html", "json", "css", "scss", "org", "swift", "c_sharp", "todotxt", "typescript", "tsx", "scala", "hcl", "markdown", "toml", "vue", "jsonc", "yaml", "yang", "ninja", "nix", "dart", "rst", "regex", "comment", "devicetree", "svelte", "r", "beancount", "latex", "bibtex", "zig", "cmake", "vim", "help", "json5", "hjson", "http", "make", "proto"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- possible options: "scheme", "javascript", "rego", "c", "embedded_template", "clojure", "commonlisp", "cpp", "cuda", "d", "glsl", "dockerfile", "dot", "rust", "fusion", "ledger", "lua", "python", "go", "gomod", "gowork", "graphql", "ruby", "perl", "bash", "fish", "php", "java", "kotlin", "html", "julia", "json", "css", "scss", "erlang", "elixir", "gleam", "surface", "eex", "heex", "ocaml", "ocaml_interface", "ocamllex", "org", "swift", "c_sharp", "todotxt", "typescript", "tsx", "scala", "supercollider", "slint", "haskell", "hcl", "markdown", "tlaplus", "toml", "glimmer", "pug", "vue", "jsonc", "elm", "yaml", "yang", "ninja", "nix", "dart", "rst", "fennel", "teal", "ql", "verilog", "pascal", "phpdoc", "regex", "comment", "jsdoc", "query", "sparql", "gdscript", "godot_resource", "turtle", "devicetree", "svelte", "r", "beancount", "latex", "bibtex", "zig", "fortran", "cmake", "vim", "help", "json5", "pioasm", "hjson", "hocon", "llvm", "http", "prisma", "make", "rasi", "foam", "hack", "norg", "vala", "lalrpop", "solidity", "cooklang", "elvish", "astro", "wgsl", "m68k", "proto", "v",
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
