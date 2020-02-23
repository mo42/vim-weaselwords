# badwords
Highlight words in Vim that indicate bad style.

## Installation

| Plugin Manager | Installation |
|Vundle | `Plugin 'vim-airline/vim-airline'` |

## Usage

This plugin provides highlighting of fuzzy words. You can highlight bad words
using:

`call HighlightBadwords(spell_language)`

Currently, this plugin includes English ('en_us') and German ('de_de').
Calling this function with another languages clears previous highlights. To
clear existing highlights call with the empty string:

`call HighlightBadwords('')`

