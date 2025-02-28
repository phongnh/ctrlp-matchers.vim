# ctrlp-matchers.vim

Collection of CtrlP Matchers

- `pfzy` - `ctrlp_matchers#pfzy#match` (https://github.com/kazhala/pfzy)
- `matchfuzzypos` - `ctrlp_matchers#matchfuzzypos#match`
- `matchfuzzy` - `ctrlp_matchers#matchfuzzy#match`
- `fzy_lua_native` - `ctrlp_matchers#fzy_lua#match` (https://github.com/romgrk/fzy-lua-native)
- `fzy_lua` - `ctrlp_matchers#fzy_lua#match` (https://github.com/swarn/fzy-lua)

## Installation

### Vim

```vim
if has('python3') && executable('pip3')
    Plug 'phongnh/ctrlp-matchers.vim', { do: 'pip3 install --user --upgrade pfzy --break-system-packages' }
elseif exists('*matchfuzzypos') || exists('matchfuzzy')
    Plug 'phongnh/ctrlp-matchers.vim'
endif
```

### Neovim

```lua
{
  -- Fuzzy file, buffer, mru, tag, etc finder.
  -- https://github.com/ctrlpvim/ctrlp.vim
  "ctrlpvim/ctrlp.vim",
  dependencies = {
    -- Collection of CtrlP matchers
    -- https://github.com/phongnh/ctrlp-matchers.vim
    "phongnh/ctrlp-matchers.vim",
    dependencies = {
        {
          -- Luajit FFI bindings to FZY
          -- https://github.com/romgrk/fzy-lua-native
          "romgrk/fzy-lua-native",
          build = "make"
        },
        -- {
        --   -- A lua implementation of the fzy fuzzy matching algorithm
        --   -- https://github.com/swarn/fzy-lua
        --   "swarn/fzy-lua",
        -- },
    },
  },
}
```
