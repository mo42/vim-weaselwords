# vim-weaselwords

Improve your writing in Vim by highlighting weasel words. For example in
sentences like this:

<span style="color:white; background:red">More often than not</span>, I find
<span style="color:white; background:red">myself</span> using <span
style="color:white; background:red">arguably</span> <span style="color:white;
background:red">generic</span> and, <span style="color:white;
background:red">of course</span>, overused phrases that add <span
style="color:white; background:red">more or less</span> nothing to my writing.

## Features

- Simply based on word lists that the user can edit or a community can maintain.
- No need to connect to the internet. Your texts stay in your editor.
- Experimental passive detection for English

### Supported Languages
- English
- German
- French
- Spanish

## Installation

| Plugin Manager | Plugin Section |
| --- | --- |
|Vim-Plug | `Plug 'mo42/vim-weaselwords'` |
|pathogen.vim| `Plug 'mo42/vim-weaselwords'` |
|Vundle | `Plugin 'mo42/vim-weaselwords'` |

Then, run `:PluginInstall` (Vundle) or `:PlugInstall` (Vim-plug).

## Usage

Highlight weasel words of a language like so:

`call HighlightWeaselWords(spell_language)`

Currently, this plugin includes English ('en_us') and German ('de_de').
Calling this function with another languages clears previous highlights. To
clear existing highlights call with the empty string:

`call HighlightWeaselWords('')`

VimScript for cycling through spell checkers and enabling corresponding weasel
words:

```vim
nnoremap <leader>l :call CycleSpellLanguage()<cr>
let g:current_spell_language = ''
function CycleSpellLanguage()
  let languages = ['', 'en_us', 'de_de']
  let i = (index(languages, g:current_spell_language) + 1) % len(languages)
  let g:current_spell_language = languages[i]
  call HighlightWeaselWords(g:current_spell_language)
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

## License

This project is licensed under the MIT License - see the LICENSE file for details.
