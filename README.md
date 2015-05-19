dotfiles
========
| Vim Command | Action |
| --- | --- |
| ,f | Toggle file tree |
| ,p | Fuzzy file find |
| ,P | Fuzzy file find (modified files) |
| ,m | Open command shortcuts reference file |
| ,a | Ag (Ack) |
| ,s | Syntax check |
| ,\ | Toggle tabs / spaces |
| ,\| | Toggle indentation size |
| ,c | Copy selected text |
| ,x | Cut selected text |
| ,v | Paste (preserve indentation) [I] |
| ,V | Toggle paste mode |
| ,y | Yank entire file |
| ,/ | Toggle comment block |
| ,t | New tab |
| ,[tab] | Next tab |
| ,[shift][tab] | Previous tab |
| ,q | Close tab |
| ,Q | Save session and exit |
| ,[1-9] | Navigate to tab _num_ |
| ,0 | Navigate to last tab |
| ,` | Move focus between windows |
| ,w | Strip trailing whitespace |
| ,gd | Compare staged changes against master |
| ,gh | View file on Github |
| ,gH | Copy Github file URL to clipboard |
| ,gs | `git status` |
| ,gb | `git blame` |
| ,gc | `git commit` |
| ,gp | `git pull` |
| ,gu | `git push` |

## Vim Changelog

5.19.2015
- Show tab number in tabline as opposed to number of splits (default).
- Don't show buffers in tabline.
- Don't show "close" trigger in tabline.

4.2.2015
- The '%' operator will now take you to matching HTML tags and more.
- Auto closing brackets, quotes, parenthesis.
- Auto indentation on block definitions.

3.29.15
- Disable Syntastic by default. Update binding to toggle mode.

3.2.15
- Added 'vim-shot-f' to plugin list.
- Write as root binding (w!!).
- Added shortcuts for copy and cut.
- Updated comment block binding (,/).
- Open in OS binding (,o).
- Save session and quit binding (,Q).

2.4.15
- ‘;;’ exits insert mode instead of ‘ii’.
- Backup, swap and undo files have been moved out of working directory to their own locations in ‘~/.vim/‘. These directories will automatically be created if they do not yet exist.
- Saved Vim session file now gets saved to ‘~/.vim/‘ instead of working directory.
- Added ‘vimsurround’ for quick highlighting.

1.27.15
- ‘[space]’ enters insert mode.
- ‘ii’ exits insert mode.
- ‘,Q’ will save session, save files and exit Vim. Session can be reopened with ‘vim -S’.
- Pressing [enter] or double clicking on a fuzzy finder entry will open it in a new tab as opposed to edit mode.
- Prefer Ag (silver searcher) to Ack when available.
- Prefer Ag (silver searcher) in fuzzy finder when available.
- Added Ag ignore file.
- Added ‘wildfire’ plugin for text selection.
- Mapped ‘//‘ to clear highlighted searches.

1.24.15
- Save when losing focus or switching buffers
- Automatically reload files modified outside of Vim
- Immediately apply changes to Vim configuration
- [Enter] will clear highlighted matches
- Enable spellchecking for git commit messages
- Highlight trailing whitespace as error in visual mode
- Strip all whitespace key binding (,w)
- Automatic indentation settings detection
- Indentation size toggle (,|)
- Set preferred backup, swap and undo locations (enables persistent undo)
- HTML5 completion support.
- Improved CSS3 Syntax.
- Improved JavaScript syntax.
- Improved JSON syntax.
- Write / quit command typo corrections
- Configuration file housekeeping
