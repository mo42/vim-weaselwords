# vim-weaselwords

Improve your writing in Vim by highlighting weasel words.
The plugin highlights weaselwords in red and passive sentences in blue. Example:

![vim-weaselwords example in Vim editor](example.png)

## Features

- Simply based on word lists that the user can edit or a community can maintain.
- No need to connect to the internet. Your texts stay in your editor.
- Experimental passive detection for English and German

### Supported Languages
- English
- German
- French
- Spanish
- Dutch (basic)

## Installation

| Plugin Manager | Plugin Section |
| --- | --- |
|Vim-Plug | `Plug 'mo42/vim-weaselwords'` |
|pathogen.vim| `Plug 'mo42/vim-weaselwords'` |
|Vundle | `Plugin 'mo42/vim-weaselwords'` |
|Packer | `use 'mo42/vim-weaselwords'` |

Then, run `:PluginInstall` (Vundle) or `:PlugInstall` (Vim-plug) etc.

## Usage

### Highlight weasel words

`call HighlightWeaselWords(spell_language)`

Currently, this plugin includes English ('en_us') and German ('de_de').
Calling this function with another languages clears previous highlights. To
clear existing highlights call with the empty string:

`call HighlightWeaselWords('')`

### Highlight passive sentences:

`call HighlightPassive(g:current_spell_language)`

### Cycling through spell checkers, weasel words and passive
VimScript snippet for cycling through spell checkers and enabling corresponding weasel
words:

```vim
nnoremap <leader>l :call CycleSpellLanguage()<cr>
let g:current_spell_language = ''
function CycleSpellLanguage()
  let languages = ['', 'en_us', 'de_de']
  let i = (index(languages, g:current_spell_language) + 1) % len(languages)
  let g:current_spell_language = languages[i]
  call HighlightWeaselWords(g:current_spell_language)
  call HighlightPassive(g:current_spell_language)
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

Lua snippet for cycling through spell checkers and enabling corresponding weasel
words:
```lua
local current_spell_language = "en_us"
local languages = { "en_us", "de_de", "" }
local function cycle_spell_language()
  local index = vim.tbl_contains(languages, current_spell_language) and vim.fn.index(languages, current_spell_language) or 0
  current_spell_language = languages[(index + 1) % #languages + 1]
  if current_spell_language == '' then
    vim.opt.spell = false
    print('No spell language')
  else
    vim.opt.spell = true
    vim.opt.spelllang = current_spell_language
    print('Current spell language: ' .. current_spell_language)
  end
  vim.fn['HighlightWeaselWords'](current_spell_language)
  vim.fn['HighlightPassive'](current_spell_language)
end

vim.keymap.set('n', '<leader>l', cycle_spell_language, { desc = "Cycle through spell languages" })
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
