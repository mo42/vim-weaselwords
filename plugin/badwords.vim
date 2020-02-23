let s:fileBase = expand('<sfile>:p:h')
let g:badWordsCurrentMatches = []

function s:LoadBadWordsLanguage(language)
  let l:f = s:fileBase . '/../badwords_' . a:language . '.txt'
  for line in readfile(l:f)
    let l:id = matchadd('badWordsGroup', '\c' . line)
    call add(g:badWordsCurrentMatches, l:id)
  endfor
endfunction

function s:RemoveMatches()
  for i in g:badWordsCurrentMatches
    call matchdelete(i)
  endfor
  let g:badWordsCurrentMatches = []
endfunction

function HighlightBadwords(language)
  highlight badWordsGroup ctermbg=red ctermfg=white
  call s:RemoveMatches()
  if (len(a:language) > 0)
    call s:LoadBadWordsLanguage(a:language)
  endif
endfunction

