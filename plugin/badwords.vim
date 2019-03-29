function LoadBadWordsLanguage(language)
  for line in readfile("badwords_" . a:language . ".txt")
    call matchadd("badWordsGroup", "\c" . line)
  endfor
endfunction

function LoadBadWords()
  highlight badWordsGroup ctermbg=red ctermfg=white
  call LoadBadWordsLanguage('en')
  call LoadBadWordsLanguage('de')
endfunction
