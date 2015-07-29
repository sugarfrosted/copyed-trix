function EnDashPat(names)
    let l:atomic = ""
    let l:first = 1
    for l:name in a:names
        if l:first
            let l:atomic .= "\\("
            let l:first = 0
        else
            let l:atomic .= "\\|"
        endif
        let l:atomic .= l:name
    endfor
    let l:atomic .= "\\)"
    return l:atomic
endfunction

function EnDashSub(names)
    let l:subpatrick = EnDashPat(a:names)
    let l:pattern = l:subpatrick . "-" . l:subpatrick
    let l:repl = "\\1--\\2"
    let l:mode = "g"
    let l:working = 1
    while l:working
        try
            exe "%substitute/" . l:pattern . "/" . l:repl . "/" . l:mode
        catch /.*/
            let l:working = 0
        endtry
    endwhile
endfunction
    
