function LoadBadWordsLanguage(language)
<<<<<<< HEAD
  let s:file = expand('<sfile>:p:h') . '/../badwords_' . a:language . '.txt'
  for line in readfile(s:file)
    call matchadd('badWordsGroup', '\c' . line)
=======
  for line in readfile("badwords_" . a:language . ".txt")
    call matchadd("badWordsGroup", "\c" . line)
>>>>>>> parent of 8386ca5... Read words from external files
  endfor
endfunction

function LoadBadWords()
  highlight badWordsGroup ctermbg=red ctermfg=white
  call LoadBadWordsLanguage('en')
  call LoadBadWordsLanguage('de')
endfunction
