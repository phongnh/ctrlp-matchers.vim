_G.CtrlPMatchers = {}

if vim.g.ctrlp_match_func == nil then
  CtrlPMatchers.fzy = {}

  if pcall(require, "fzy-lua-native") then
    local fzy_lua_native = require("fzy-lua-native")
    CtrlPMatchers.fzy.filter = fzy_lua_native.filter_many ~= nil and fzy_lua_native.filter_many or fzy_lua_native.filter
    CtrlPMatchers.fzy.provider = "fzy-lua-native"
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#fzy_lua#match" }
  elseif pcall(require, "fzy") then
    CtrlPMatchers.fzy.filter = require("fzy").filter
    CtrlPMatchers.fzy.provider = "fzy"
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#fzy_lua#match" }
  elseif vim.fn.exists("*matchfuzzypos") == 1 and vim.fn.exists("*matchfuzzy") == 1 then
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#matchfuzzypos#match" }
  elseif vim.fn.exists("*matchfuzzy") == 1 then
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#matchfuzzy#match" }
  end
end
