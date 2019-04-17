function LoadBadWordsLanguage(language)
  let s:file = expand('<sfile>:p:h') . '/badwords_' . a:language . '.txt'
  for line in readfile(s:file)
    call matchadd('badWordsGroup', '\c' . line)
  endfor
endfunction

function LoadBadWords()
  highlight badWordsGroup ctermbg=red ctermfg=white
  call LoadBadWordsLanguage('en')
  call LoadBadWordsLanguage('de')
endfunction

call LoadBadWords()
