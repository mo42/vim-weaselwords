function LoadBadWordsLanguage(language)
  for line in readfile('badwords_' + language + '.txt')
    call matchadd('badWordsGroup', line)
  endfor
endfunction

function LoadBadWords()
  highlight badWordsGroup ctermbg=red ctermfg=white
  LoadBadWordsLanguage('en')
  LoadBadWordsLanguage('de')
endfunction
