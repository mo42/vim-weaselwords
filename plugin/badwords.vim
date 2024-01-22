let s:fileBase = expand('<sfile>:p:h')
let g:weaselWordsCurrentMatches = []

function s:LoadWeaselWordsLanguage(language)
  let l:f = s:fileBase . '/../weaselwords_' . a:language . '.txt'
  for line in readfile(l:f)
    let l:id = matchadd('weaselWordsGroup', '\c' . line)
    call add(g:weaselWordsCurrentMatches, l:id)
  endfor
endfunction

function s:RemoveMatches()
  for i in g:weaselWordsCurrentMatches
    call matchdelete(i)
  endfor
  let g:weaselWordsCurrentMatches = []
endfunction

function HighlightWeaselWords(language)
  highlight weaselWordsGroup ctermbg=red ctermfg=white
  call s:RemoveMatches()
  if (len(a:language) > 0)
    call s:LoadWeaselWordsLanguage(a:language)
  endif
endfunction

