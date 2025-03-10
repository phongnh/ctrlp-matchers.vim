# ctrlp-matchers.vim

Collection of CtrlP Matchers

- `pfzy` - `ctrlp_matchers#pfzy#match` (https://github.com/kazhala/pfzy)
- `matchfuzzypos` - `ctrlp_matchers#matchfuzzypos#match`
- `matchfuzzy` - `ctrlp_matchers#matchfuzzy#match`
- `fzf_lua` - `ctrlp_matchers#fzf_lua#match` (https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- `fzy_lua` - `ctrlp_matchers#fzy_lua#match` (https://github.com/romgrk/fzy-lua-native or https://github.com/swarn/fzy-lua)

## Installation

### Vim

```vim
" vim-plug
if has('python3') && executable('pip3')
    Plug 'phongnh/ctrlp-matchers.vim', { do: 'pip3 install --user --upgrade pfzy --break-system-packages' }
elseif exists('*matchfuzzypos') || exists('matchfuzzy')
    Plug 'phongnh/ctrlp-matchers.vim'
endif
```

### Neovim

```lua
-- lazy.vim
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
          -- FZF sorter for telescope written in c
          -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
          "nvim-telescope/telescope-fzf-native.nvim"
          build = "make"
        },
        -- {
        --   -- Luajit FFI bindings to FZY
        --   -- https://github.com/romgrk/fzy-lua-native
        --   "romgrk/fzy-lua-native",
        --   build = "make"
        -- },
        -- {
        --   -- A lua implementation of the fzy fuzzy matching algorithm
        --   -- https://github.com/swarn/fzy-lua
        --   "swarn/fzy-lua",
        -- },
    },
  },
}
```
