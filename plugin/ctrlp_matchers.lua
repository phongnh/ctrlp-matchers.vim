if vim.g.ctrlp_match_func == nil then
  if pcall(require, "fzy") then
    vim.g.ctrlp_match_func = { match = "ctrlp_matchers#fzy_lua#match" }
  end
end
