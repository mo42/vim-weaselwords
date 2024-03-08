let s:fileBase = expand('<sfile>:p:h')
let g:weaselWordsCurrentMatches = []
let g:passiveMatches = []

function! s:LoadWeaselWordsLanguage(language)
  let l:f = s:fileBase . '/../weaselwords_' . a:language . '.txt'
  if !filereadable(l:f)
    echomsg "File of weasel words not found: " . l:f
    return
  endif
  for line in readfile(l:f)
    let l:id = matchadd('weaselWordsGroup', '\c' . line)
    call add(g:weaselWordsCurrentMatches, l:id)
  endfor
endfunction

function! s:RemoveMatches()
  for i in g:weaselWordsCurrentMatches
    call matchdelete(i)
  endfor
  let g:weaselWordsCurrentMatches = []
  for i in g:passiveMatches
    call matchdelete(i)
  endfor
  let g:passiveMatches = []
endfunction

function! HighlightWeaselWords(language)
  highlight weaselWordsGroup ctermbg=red ctermfg=white
  call s:RemoveMatches()
  if (len(a:language) > 0)
    call s:LoadWeaselWordsLanguage(a:language)
  endif
endfunction

function! s:LoadPassiveWords(language)
  let l:f = s:fileBase . '/../passive_words_' . a:language . '.txt'
  if !filereadable(l:f)
    echomsg "File of passive words not found: " . l:f
    return
  endif
  let l:passiveWords = readfile(l:f)
  let l:sepIdx = index(l:passiveWords, '--')
  let l:passivePrefixes = filter(copy(l:passiveWords), {idx, _ -> idx < l:sepIdx })
  let l:passiveWords = filter(copy(l:passiveWords), {idx, _ -> idx > l:sepIdx })
  let l:passiveVoicePattern = '\v(' . join(l:passivePrefixes, '|') . ')\s+(\w+ed|\w+en\s|' . join(l:passiveWords, '|')  . ')'
  let l:id = matchadd('passiveWordGroup', '\c' . l:passiveVoicePattern)
  call add(g:passiveMatches, l:id)
endfunction

function! HighlightPassive(language)
  highlight passiveWordGroup ctermbg=blue ctermfg=white
  if (len(a:language) > 0)
    call s:LoadPassiveWords(a:language)
  endif
endfunction
