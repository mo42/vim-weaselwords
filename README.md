# badwords
Highlight words in Vim that indicate bad style.

## Installation

| Plugin Manager | Installation |
| --- | --- |
|Vundle | `Plugin 'mo42/badwords'` |

## Usage

This plugin provides highlighting of fuzzy words. You can highlight bad words
using:

`call HighlightBadwords(spell_language)`

Currently, this plugin includes English ('en_us') and German ('de_de').
Calling this function with another languages clears previous highlights. To
clear existing highlights call with the empty string:

`call HighlightBadwords('')`

Code for cycling through spell checkers and badwords

```vimscript
nnoremap <leader>l :call CycleSpellLanguage()<cr>
let g:current_spell_language = ''
function CycleSpellLanguage()
  let languages = ['', 'en_us', 'de_de']
  let i = (index(languages, g:current_spell_language) + 1) % len(languages)
  let g:current_spell_language = languages[i]
  call HighlightBadwords(g:current_spell_language)
  if empty(g:current_spell_language)
    set nospell
    echo 'No spell language'
  else
    set spell
    let &spelllang=g:current_spell_language
    echo 'Current spell language ' . g:current_spell_language
  endif
endfunction
```
