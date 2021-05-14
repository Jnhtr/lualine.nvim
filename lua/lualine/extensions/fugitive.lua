-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
local function fugitive_branch()
  local icon = '' -- e0a0
  return icon .. ' ' .. vim.fn.FugitiveHead()
end
return {
  sections = {lualine_a = {fugitive_branch}, lualine_z = {'location'}},
  filetypes = {'fugitive'}
}
