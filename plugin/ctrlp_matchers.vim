if globpath(&rtp, 'plugin/ctrlp.vim') == ''
    echohl WarningMsg | echomsg 'ctrlp.vim is not found.' | echohl none
    finish
endif

if get(g:, 'loaded_ctrlp_matchers', 0)
    finish
endif

let g:loaded_ctrlp_matchers = 1

if !exists('g:ctrlp_match_function')
    if has('python3')
        let g:ctrlp_match_func = { 'match': 'ctrlp_matchers#pfzy#match' }
    elseif exists('*matchfuzzypos') && exists('*matchfuzzy')
        let g:ctrlp_match_func = { 'match': 'ctrlp_matchers#matchfuzzypos#match' }
    elseif exists('*matchfuzzy')
        let g:ctrlp_match_func = { 'match': 'ctrlp_matchers#matchfuzzy#match' }
    endif
endif

