# ctrlp-matchers.vim

Collection of CtrlP Matchers

- `pfzy` - `ctrlp_matchers#pfzy#match` (https://github.com/kazhala/pfzy)
- `matchfuzzypos` - `ctrlp_matchers#matchfuzzypos#match`
- `matchfuzzy` - `ctrlp_matchers#matchfuzzy#match`
- `fzy_lua` - `ctrlp_matchers#fzy_lua#match` (https://github.com/swarn/fzy-lua)

## Installation

```vim
if has('python3') && executable('pip3')
    Plug 'phongnh/ctrlp-matchers.vim', { do: 'pip3 install --user --upgrade pfzy --break-system-packages' }
elseif exists('*matchfuzzypos') || exists('matchfuzzy')
    Plug 'phongnh/ctrlp-matchers.vim'
endif
```
