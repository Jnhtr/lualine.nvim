-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
-- LuaFormatter off
local map = {
  ['n']    = 'NORMAL',
  ['no']   = 'O-PENDING',
  ['nov']  = 'O-PENDING',
  ['noV']  = 'O-PENDING',
  ['no'] = 'O-PENDING',
  ['niI']  = 'NORMAL',
  ['niR']  = 'NORMAL',
  ['niV']  = 'NORMAL',
  ['v']    = 'VISUAL',
  ['V']    = 'V-LINE',
  ['']   = 'V-BLOCK',
  ['s']    = 'SELECT',
  ['S']    = 'S-LINE',
  ['']   = 'S-BLOCK',
  ['i']    = 'INSERT',
  ['ic']   = 'INSERT',
  ['ix']   = 'INSERT',
  ['R']    = 'REPLACE',
  ['Rc']   = 'REPLACE',
  ['Rv']   = 'V-REPLACE',
  ['Rx']   = 'REPLACE',
  ['c']    = 'COMMAND',
  ['cv']   = 'EX',
  ['ce']   = 'EX',
  ['r']    = 'REPLACE',
  ['rm']   = 'MORE',
  ['r?']   = 'CONFIRM',
  ['!']    = 'SHELL',
  ['t']    = 'TERMINAL',
}
-- LuaFormatter on
return {
  get_mode = function()
    local mode_code = vim.api.nvim_get_mode().mode
    if map[mode_code] == nil then return mode_code end
    return map[mode_code]
  end
}
