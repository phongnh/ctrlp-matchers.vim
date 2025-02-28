if vim.g.ctrlp_match_func == nil then
  if pcall(require, "fzy-lua-native") then
    if require("fzy-lua-native").filter_many ~= nil then
      vim.g.fzy_lua_native_version = "native"
    else
      vim.g.fzy_lua_native_version = "original"
    end
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#fzy_lua_native#match" }
  elseif pcall(require, "fzy") then
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#fzy_lua#match" }
  end
end
