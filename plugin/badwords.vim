function LLoadBadWordsLanguage(language)
  for line in readfile("badwords_" . a:language . ".txt")
    call matchadd("badWordsGroup", line)
  endfor
endfunction

function LLoadBadWords()
  highlight badWordsGroup ctermbg=red ctermfg=white
  call LLoadBadWordsLanguage('en')
  call LLoadBadWordsLanguage('de')
endfunction
