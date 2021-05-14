-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
local function get_short_cwd() return vim.fn.fnamemodify(vim.fn.getcwd(), ':~') end
return {sections = {lualine_a = {get_short_cwd}}, filetypes = {'nerdtree'}}
