let s:fileBase = expand('<sfile>:p:h')

function LoadBadWordsLanguage(language)
  let l:f = s:fileBase . '/../badwords_' . a:language . '.txt'
  for line in readfile(l:f)
    call matchadd('badWordsGroup', '\c' . line)
  endfor
endfunction

function LoadBadWords()
  highlight badWordsGroup ctermbg=red ctermfg=white
  call LoadBadWordsLanguage('en')
  call LoadBadWordsLanguage('de')
endfunction

call LoadBadWords()
