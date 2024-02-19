require'nvim-treesitter.configs'.setup {
  ensure_installed = {"json", "matlab", "solidity", "zig" , "javascript", "typescript", "python", "cpp", "cmake", "java", "xml", "html", "css", "rust", "c", "lua", "vim", "vimdoc", "query"},
  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
