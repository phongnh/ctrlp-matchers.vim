_G.CtrlPMatchers = {}

CtrlPMatchers.fzy = function() end

if vim.g.ctrlp_match_func == nil then
  if pcall(require, "fzy-lua-native") then
    if require("fzy-lua-native").filter_many ~= nil then
      _G.CtrlPMatchers.fzy = require("fzy-lua-native").filter_many
    else
      _G.CtrlPMatchers.fzy = require("fzy-lua-native").filter
    end
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#fzy_lua#match" }
  elseif pcall(require, "fzy") then
    _G.CtrlPMatchers.fzy = require("fzy").filter
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#fzy_lua#match" }
  end
end
