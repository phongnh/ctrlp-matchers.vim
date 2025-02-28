# ctrlp-matchers.vim

Collection of CtrlP Matchers

- `pfzy` - `ctrlp_matchers#pfzy#match`
- `matchfuzzypos` - `ctrlp_matchers#matchfuzzypos#match`
- `matchfuzzy` - `ctrlp_matchers#matchfuzzy#match`

## Installation

```vim
if has('python3') && executable('pip3')
    Plug 'phongnh/ctrlp-matchers.vim', { do: 'pip3 install --user --upgrade pfzy --break-system-packages' }
elseif exists('*matchfuzzypos') || exists('matchfuzzy')
    Plug 'phongnh/ctrlp-matchers.vim'
endif
```
