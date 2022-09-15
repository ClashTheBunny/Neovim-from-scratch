vim.cmd [[
try
  " colorscheme onedark
  " colorscheme monokai
  colorscheme molokai
  " colorscheme synthwave
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
