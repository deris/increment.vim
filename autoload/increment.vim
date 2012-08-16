
function! increment#next_pattern()
    let s:pattern_list = []
    for i in range(v:count1)
        try
            let s:pattern_list = g:increment_vim[&filetype]
            let s:cursor_str1 = expand("<cWORD>")
            let s:cursor_str2 = expand("<cword>")
            let vital = vital#of('increment.vim')
            let vital_DataList = vital.import('Data.List')
            if vital_DataList.has(s:pattern_list, s:cursor_str1)
                let l:pattern_index = index(s:pattern_list, s:cursor_str1)
                let l:pattern_index += 1
                if l:pattern_index >= len(s:pattern_list)
                    let l:pattern_index = 0
                endif
                execute "normal! ciW" . s:pattern_list[l:pattern_index]
            elseif  vital_DataList.has(s:pattern_list, s:cursor_str2)
                let l:pattern_index = index(s:pattern_list, s:cursor_str2)
                let l:pattern_index += 1
                if l:pattern_index >= len(s:pattern_list)
                    let l:pattern_index = 0
                endif
                let l:save_reg = @/
                execute "normal! *"
                execute "nohlsearch"
                execute "normal! ciw" . s:pattern_list[l:pattern_index]
                call histdel("search", -1)
                let @/ = l:save_reg
            else
                execute "normal! \<c-a>"
            endif
        catch
            execute "normal! \<c-a>"
        endtry
    endfor

endfunction

function! increment#prev_pattern()
    let s:pattern_list = []
    for i in range(v:count1)
        try
            let s:pattern_list = g:increment_vim[&filetype]
            let s:cursor_str1 = expand("<cWORD>")
            let s:cursor_str2 = expand("<cword>")
            let vital = vital#of('increment.vim')
            let vital_DataList = vital.import('Data.List')
            if vital_DataList.has(s:pattern_list, s:cursor_str1)
                let l:pattern_index = index(s:pattern_list, s:cursor_str1)
                let l:pattern_index -= 1
                if l:pattern_index < 0
                    let l:pattern_index = len(s:pattern_list) - 1
                endif
                execute "normal! ciW" . s:pattern_list[l:pattern_index]
            elseif  vital_DataList.has(s:pattern_list, s:cursor_str2)
                let l:pattern_index = index(s:pattern_list, s:cursor_str2)
                let l:pattern_index -= 1
                if l:pattern_index < 0
                    let l:pattern_index = len(s:pattern_list) - 1
                endif
                let l:save_reg = @/
                execute "normal! *"
                execute "nohlsearch"
                execute "normal! ciw" . s:pattern_list[l:pattern_index]
                call histdel("search", -1)
                let @/ = l:save_reg
            else
                execute "normal! \<c-x>"
            endif
        catch
            execute "normal! \<c-x>"
        endtry
    endfor

endfunction

