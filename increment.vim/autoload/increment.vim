
function! increment#next_pattern()
    let s:pattern_list = []
    try
        let s:pattern_list = g:increment_vim[&filetype]
        let s:cursor_str = expand("<cword>")
        let vital = vital#of('increment.vim')
        let vital_DataList = vital.import('Data.List')
        if vital_DataList.has(s:pattern_list, s:cursor_str)
            let l:pattern_index = index(s:pattern_list, s:cursor_str)
            let l:pattern_index += 1
            if l:pattern_index >= len(s:pattern_list)
                let l:pattern_index = 0
            endif
            execute "normal! ciw" . s:pattern_list[l:pattern_index]
        elseif
            execute "normal! \<c-a>"
        endif
    catch
        execute "normal! \<c-a>"
    endtry

endfunction

function! increment#prev_pattern()
    let s:pattern_list = []
    try
        let s:pattern_list = g:increment_vim[&filetype]
        let s:cursor_str = expand("<cword>")
        let vital = vital#of('increment.vim')
        let vital_DataList = vital.import('Data.List')
        if vital_DataList.has(s:pattern_list, s:cursor_str)
            let l:pattern_index = index(s:pattern_list, s:cursor_str)
            let l:pattern_index -= 1
            if l:pattern_index < 0
                let l:pattern_index = len(s:pattern_list) - 1
            endif
            execute "normal! ciw" . s:pattern_list[l:pattern_index]
        elseif
            execute "normal! \<c-x>"
        endif
    catch
        execute "normal! \<c-x>"
    endtry

endfunction
