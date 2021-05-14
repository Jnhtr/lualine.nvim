-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
return {
  sections = vim.deepcopy(require'lualine.extensions.nerdtree'.sections),
  filetypes = {'CHADTree'}
}
