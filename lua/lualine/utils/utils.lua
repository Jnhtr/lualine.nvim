-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- table to store the highlight names created by lualine
local loaded_highlights = {}
return {
  -- Note for now only works for termguicolors scope can be bg or fg or any other
  -- attr parameter like bold/italic/reverse
  extract_highlight_colors = function(color_group, scope)
    if vim.fn.hlexists(color_group) == 0 then return nil end
    local color = vim.api.nvim_get_hl_by_name(color_group, true)
    if color.background ~= nil then
      color.bg = string.format('#%06x', color.background)
      color.background = nil
    end
    if color.foreground ~= nil then
      color.fg = string.format('#%06x', color.foreground)
      color.foreground = nil
    end
    if scope then return color[scope] end
    return color
  end,

  -- sets loaded_highlights table
  save_highlight = function(highlight_name, highlight_args)
    loaded_highlights[highlight_name] = highlight_args
  end,

  reload_highlights = function()
    local highlight = require('lualine.highlight')
    for _, highlight_args in pairs(loaded_highlights) do
      highlight.highlight(unpack(highlight_args))
    end
  end,

  -- determine if an highlight exist and isn't cleared
  highlight_exists = function(highlight_name)
    return loaded_highlights[highlight_name] and true or false
  end,

  -- clears loaded_highlights table and highlights
  clear_highlights = function()
    for highlight_name, _ in pairs(loaded_highlights) do
      vim.cmd('highlight clear ' .. highlight_name)
      loaded_highlights[highlight_name] = nil
    end
  end,

  -- remove empty strings from list
  list_shrink = function(list)
    local new_list = {}
    for i = 1, #list do
      if list[i] and #list[i] > 0 then table.insert(new_list, list[i]) end
    end
    return new_list
  end
}
