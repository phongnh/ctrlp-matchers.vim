if has('nvim')
    finish
endif

if globpath(&rtp, 'plugin/ctrlp.vim') == ''
    echohl WarningMsg | echomsg 'ctrlp.vim is not found.' | echohl none
    finish
endif

if get(g:, 'loaded_ctrlp_matchers', 0)
    finish
endif

let g:loaded_ctrlp_matchers = 1

if !exists('g:ctrlp_match_func')
    function! s:HasPfzy() abort
        try
            python3 import pfzy
            return 1
        catch
            return 0
        endtry
    endfunction
    if has('python3') && s:HasPfzy()
        let g:ctrlp_match_func = { 'match': 'ctrlp_matchers#pfzy#match' }
    elseif exists('*matchfuzzypos') && exists('*matchfuzzy')
        let g:ctrlp_match_func = { 'match': 'ctrlp_matchers#matchfuzzypos#match' }
    elseif exists('*matchfuzzy')
        let g:ctrlp_match_func = { 'match': 'ctrlp_matchers#matchfuzzy#match' }
    endif
endif
