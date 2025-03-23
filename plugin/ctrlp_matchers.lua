_G.CtrlPMatchers = {}

if vim.g.ctrlp_match_func == nil then
  if pcall(require, "fzf_lib") then
    CtrlPMatchers.fzf = function(str, items, case_mode, fuzzy)
      local case_mode = vim.F.if_nil(case_mode, 0) -- 0 = smart_case | 1 = ignore_case | 2 = respect_case
      local fuzzy = vim.F.if_nil(fuzzy, true)
      local fzf = require("fzf_lib")
      local slab = fzf.allocate_slab()
      local pattern_obj = fzf.parse_pattern(str, case_mode, fuzzy)
      local result = {}
      local score
      local pos
      for idx, line in ipairs(items) do
        score = fzf.get_score(line, pattern_obj, slab)
        if score > 0 then
          pos = fzf.get_pos(line, pattern_obj, slab)
          result[#result + 1] = { line, pos, 1 / score }
        end
      end
      fzf.free_pattern(pattern_obj)
      fzf.free_slab(slab)
      table.sort(result, function(item1, item2)
        return item1[3] < item2[3]
      end)
      return result
    end
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#fzf_lua#match" }
  elseif pcall(require, "fzy-lua-native") then
    local fzy_lua_native = require("fzy-lua-native")
    CtrlPMatchers.fzy = {}
    CtrlPMatchers.fzy.filter = fzy_lua_native.filter_many ~= nil and fzy_lua_native.filter_many or fzy_lua_native.filter
    CtrlPMatchers.fzy.provider = "fzy-lua-native"
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#fzy_lua#match" }
  elseif pcall(require, "fzy") then
    CtrlPMatchers.fzy = {}
    CtrlPMatchers.fzy.filter = require("fzy").filter
    CtrlPMatchers.fzy.provider = "fzy"
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#fzy_lua#match" }
  elseif vim.fn.exists("*matchfuzzypos") == 1 and vim.fn.exists("*matchfuzzy") == 1 then
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#matchfuzzypos#match" }
  elseif vim.fn.exists("*matchfuzzy") == 1 then
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#matchfuzzy#match" }
  end
end
