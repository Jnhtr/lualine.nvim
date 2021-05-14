-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- LuaFormatter off
-- color conversion
local color_table = {
  -- lookup table for cterm colors
  -- format {'color_code', {r,g,b}}

  -- Primary 3-bit (8 colors). Unique representation!
  {'00', {   0,   0,   0 }},
  {'01', { 128,   0,   0 }},
  {'02', {   0, 128,   0 }},
  {'03', { 128, 128,   0 }},
  {'04', {   0,   0, 128 }},
  {'05', { 128,   0, 128 }},
  {'06', {   0, 128, 128 }},
  {'07', { 192, 192, 192 }},

  -- equivalent "bright" versions of original 8 colors.
  {'08', { 128, 128, 128 }},
  {'09', { 255,   0,   0 }},
  {'10', {   0, 255,   0 }},
  {'11', { 255, 255,   0 }},
  {'12', {   0,   0, 255 }},
  {'13', { 255,   0, 255 }},
  {'14', {   0, 255, 255 }},
  {'15', { 255, 255, 255 }},

  -- Strictly ascending.
  {'16', {   0,   0,   0 }},
  {'17', {   0,   0,  95 }},
  {'18', {   0,   0, 135 }},
  {'19', {   0,   0, 175 }},
  {'20', {   0,   0, 215 }},
  {'21', {   0,   0, 255 }},
  {'22', {   0,  95,   0 }},
  {'23', {   0,  95,  95 }},
  {'24', {   0,  95, 135 }},
  {'25', {   0,  95, 175 }},
  {'26', {   0,  95, 215 }},
  {'27', {   0,  95, 255 }},
  {'28', {   0, 135,   0 }},
  {'29', {   0, 135,  95 }},
  {'30', {   0, 135, 135 }},
  {'31', {   0, 135, 175 }},
  {'32', {   0, 135, 215 }},
  {'33', {   0, 135, 255 }},
  {'34', {   0, 175,   0 }},
  {'35', {   0, 175,  95 }},
  {'36', {   0, 175, 135 }},
  {'37', {   0, 175, 175 }},
  {'38', {   0, 175, 215 }},
  {'39', {   0, 175, 255 }},
  {'40', {   0, 215,   0 }},
  {'41', {   0, 215,  95 }},
  {'42', {   0, 215, 135 }},
  {'43', {   0, 215, 175 }},
  {'44', {   0, 215, 215 }},
  {'45', {   0, 215, 255 }},
  {'46', {   0, 255,   0 }},
  {'47', {   0, 255,  95 }},
  {'48', {   0, 255, 135 }},
  {'49', {   0, 255, 175 }},
  {'50', {   0, 255, 215 }},
  {'51', {   0, 255, 255 }},
  {'52', {  95,   0,   0 }},
  {'53', {  95,   0,  95 }},
  {'54', {  95,   0, 135 }},
  {'55', {  95,   0, 175 }},
  {'56', {  95,   0, 215 }},
  {'57', {  95,   0, 255 }},
  {'58', {  95,  95,   0 }},
  {'59', {  95,  95,  95 }},
  {'60', {  95,  95, 135 }},
  {'61', {  95,  95, 175 }},
  {'62', {  95,  95, 215 }},
  {'63', {  95,  95, 255 }},
  {'64', {  95, 135,   0 }},
  {'65', {  95, 135,  95 }},
  {'66', {  95, 135, 135 }},
  {'67', {  95, 135, 175 }},
  {'68', {  95, 135, 215 }},
  {'69', {  95, 135, 255 }},
  {'70', {  95, 175,   0 }},
  {'71', {  95, 175,  95 }},
  {'72', {  95, 175, 135 }},
  {'73', {  95, 175, 175 }},
  {'74', {  95, 175, 215 }},
  {'75', {  95, 175, 255 }},
  {'76', {  95, 215,   0 }},
  {'77', {  95, 215,  95 }},
  {'78', {  95, 215, 135 }},
  {'79', {  95, 215, 175 }},
  {'80', {  95, 215, 215 }},
  {'81', {  95, 215, 255 }},
  {'82', {  95, 255,   0 }},
  {'83', {  95, 255,  95 }},
  {'84', {  95, 255, 135 }},
  {'85', {  95, 255, 175 }},
  {'86', {  95, 255, 215 }},
  {'87', {  95, 255, 255 }},
  {'88', { 135,   0,   0 }},
  {'89', { 135,   0,  95 }},
  {'90', { 135,   0, 135 }},
  {'91', { 135,   0, 175 }},
  {'92', { 135,   0, 215 }},
  {'93', { 135,   0, 255 }},
  {'94', { 135,  95,   0 }},
  {'95', { 135,  95,  95 }},
  {'96', { 135,  95, 135 }},
  {'97', { 135,  95, 175 }},
  {'98', { 135,  95, 215 }},
  {'99', { 135,  95, 255 }},
  {'100', { 135, 135,   0 }},
  {'101', { 135, 135,  95 }},
  {'102', { 135, 135, 135 }},
  {'103', { 135, 135, 175 }},
  {'104', { 135, 135, 215 }},
  {'105', { 135, 135, 255 }},
  {'106', { 135, 175,   0 }},
  {'107', { 135, 175,  95 }},
  {'108', { 135, 175, 135 }},
  {'109', { 135, 175, 175 }},
  {'110', { 135, 175, 215 }},
  {'111', { 135, 175, 255 }},
  {'112', { 135, 215,   0 }},
  {'113', { 135, 215,  95 }},
  {'114', { 135, 215, 135 }},
  {'115', { 135, 215, 175 }},
  {'116', { 135, 215, 215 }},
  {'117', { 135, 215, 255 }},
  {'118', { 135, 255,   0 }},
  {'119', { 135, 255,  95 }},
  {'120', { 135, 255, 135 }},
  {'121', { 135, 255, 175 }},
  {'122', { 135, 255, 215 }},
  {'123', { 135, 255, 255 }},
  {'124', { 175,   0,   0 }},
  {'125', { 175,   0,  95 }},
  {'126', { 175,   0, 135 }},
  {'127', { 175,   0, 175 }},
  {'128', { 175,   0, 215 }},
  {'129', { 175,   0, 255 }},
  {'130', { 175,  95,   0 }},
  {'131', { 175,  95,  95 }},
  {'132', { 175,  95, 135 }},
  {'133', { 175,  95, 175 }},
  {'134', { 175,  95, 215 }},
  {'135', { 175,  95, 255 }},
  {'136', { 175, 135,   0 }},
  {'137', { 175, 135,  95 }},
  {'138', { 175, 135, 135 }},
  {'139', { 175, 135, 175 }},
  {'140', { 175, 135, 215 }},
  {'141', { 175, 135, 255 }},
  {'142', { 175, 175,   0 }},
  {'143', { 175, 175,  95 }},
  {'144', { 175, 175, 135 }},
  {'145', { 175, 175, 175 }},
  {'146', { 175, 175, 215 }},
  {'147', { 175, 175, 255 }},
  {'148', { 175, 215,   0 }},
  {'149', { 175, 215,  95 }},
  {'150', { 175, 215, 135 }},
  {'151', { 175, 215, 175 }},
  {'152', { 175, 215, 215 }},
  {'153', { 175, 215, 255 }},
  {'154', { 175, 255,   0 }},
  {'155', { 175, 255,  95 }},
  {'156', { 175, 255, 135 }},
  {'157', { 175, 255, 175 }},
  {'158', { 175, 255, 215 }},
  {'159', { 175, 255, 255 }},
  {'160', { 215,   0,   0 }},
  {'161', { 215,   0,  95 }},
  {'162', { 215,   0, 135 }},
  {'163', { 215,   0, 175 }},
  {'164', { 215,   0, 215 }},
  {'165', { 215,   0, 255 }},
  {'166', { 215,  95,   0 }},
  {'167', { 215,  95,  95 }},
  {'168', { 215,  95, 135 }},
  {'169', { 215,  95, 175 }},
  {'170', { 215,  95, 215 }},
  {'171', { 215,  95, 255 }},
  {'172', { 215, 135,   0 }},
  {'173', { 215, 135,  95 }},
  {'174', { 215, 135, 135 }},
  {'175', { 215, 135, 175 }},
  {'176', { 215, 135, 215 }},
  {'177', { 215, 135, 255 }},
  {'178', { 215, 175,   0 }},
  {'179', { 215, 175,  95 }},
  {'180', { 215, 175, 135 }},
  {'181', { 215, 175, 175 }},
  {'182', { 215, 175, 215 }},
  {'183', { 215, 175, 255 }},
  {'184', { 215, 215,   0 }},
  {'185', { 215, 215,  95 }},
  {'186', { 215, 215, 135 }},
  {'187', { 215, 215, 175 }},
  {'188', { 215, 215, 215 }},
  {'189', { 215, 215, 255 }},
  {'190', { 215, 255,   0 }},
  {'191', { 215, 255,  95 }},
  {'192', { 215, 255, 135 }},
  {'193', { 215, 255, 175 }},
  {'194', { 215, 255, 215 }},
  {'195', { 215, 255, 255 }},
  {'196', { 255,   0,   0 }},
  {'197', { 255,   0,  95 }},
  {'198', { 255,   0, 135 }},
  {'199', { 255,   0, 175 }},
  {'200', { 255,   0, 215 }},
  {'201', { 255,   0, 255 }},
  {'202', { 255,  95,   0 }},
  {'203', { 255,  95,  95 }},
  {'204', { 255,  95, 135 }},
  {'205', { 255,  95, 175 }},
  {'206', { 255,  95, 215 }},
  {'207', { 255,  95, 255 }},
  {'208', { 255, 135,   0 }},
  {'209', { 255, 135,  95 }},
  {'210', { 255, 135, 135 }},
  {'211', { 255, 135, 175 }},
  {'212', { 255, 135, 215 }},
  {'213', { 255, 135, 255 }},
  {'214', { 255, 175,   0 }},
  {'215', { 255, 175,  95 }},
  {'216', { 255, 175, 135 }},
  {'217', { 255, 175, 175 }},
  {'218', { 255, 175, 215 }},
  {'219', { 255, 175, 255 }},
  {'220', { 255, 215,   0 }},
  {'221', { 255, 215,  95 }},
  {'222', { 255, 215, 135 }},
  {'223', { 255, 215, 175 }},
  {'224', { 255, 215, 215 }},
  {'225', { 255, 215, 255 }},
  {'226', { 255, 255,   0 }},
  {'227', { 255, 255,  95 }},
  {'228', { 255, 255, 135 }},
  {'229', { 255, 255, 175 }},
  {'230', { 255, 255, 215 }},
  {'231', { 255, 255, 255 }},

  -- Gray-scale range.
  {'232', {   8,   8,   8 }},
  {'233', {  18,  18,  18 }},
  {'234', {  28,  28,  28 }},
  {'235', {  38,  38,  38 }},
  {'236', {  48,  48,  48 }},
  {'237', {  58,  58,  58 }},
  {'238', {  68,  68,  68 }},
  {'239', {  78,  78,  78 }},
  {'240', {  88,  88,  88 }},
  {'241', {  98,  98,  98 }},
  {'242', { 108, 108, 108 }},
  {'243', { 118, 118, 118 }},
  {'244', { 128, 128, 128 }},
  {'245', { 138, 138, 138 }},
  {'246', { 148, 148, 148 }},
  {'247', { 158, 158, 158 }},
  {'248', { 168, 168, 168 }},
  {'249', { 178, 178, 178 }},
  {'250', { 188, 188, 188 }},
  {'251', { 198, 198, 198 }},
  {'252', { 208, 208, 208 }},
  {'253', { 218, 218, 218 }},
  {'254', { 228, 228, 228 }},
  {'255', { 238, 238, 238 }},
}
-- LuaFormatter on

return {
  get_cterm_color = function(hex_color)
    local function get_color_distance(color1, color2)
      -- returns how much color2 deviates from color1
      local dr = math.abs(color1[1] - color2[1]) / (color1[1] + 1) * 100
      local dg = math.abs(color1[2] - color2[2]) / (color1[2] + 1) * 100
      local db = math.abs(color1[3] - color2[3]) / (color1[3] + 1) * 100
      return (dr + dg + db)
    end

    local r = tonumber(hex_color:sub(2, 3), 16)
    local g = tonumber(hex_color:sub(4, 5), 16)
    local b = tonumber(hex_color:sub(6, 7), 16)

    -- check which cterm color is closest to hex colors in terms of rgb values
    local closest_cterm_color = 0
    local min_distance = 10000
    for _, color in ipairs(color_table) do
      local current_distance = get_color_distance(color[2], {r, g, b})
      if current_distance < min_distance then
        min_distance = current_distance
        closest_cterm_color = color[1]
      end
    end
    return closest_cterm_color
  end
}
