dotfiles
========

For use with [iTerm2 color scheme](https://github.com/mbadolato/iTerm2-Color-Schemes) 'Twilight'.

![Vim Screenshot](https://github.com/sblaurock/dotfiles/raw/master/vim-screenshot.jpg "Vim Screenshot")

## Installation (OS X)
```
# Clone source repository
cd ${HOME} && git clone --depth 1 https://github.com/sblaurock/dotfiles.git

# Install dotfiles, dependencies (Zsh, Vundle, Powerline, Prezto) & Vim plugins
cd dotfiles && chmod +x install.sh && ./install.sh

# Build 'YouCompleteMe' Vim plugin
cd ${HOME}/.vim/bundle/YouCompleteMe; chmod +x install.sh; ./install.sh

# Activate 'Tern' autocompletion Vim plugin
cd ${HOME}/.vim/bundle/tern_for_vim; npm install
```

## Vim Key Commands
| Command | Action |
| --- | --- |
| ,w or ,k | Move window focus up |
| ,a or ,h | Move window focus left |
| ,s or ,j | Move window focus down |
| ,d or ,l | Move window focus right |
| ,W or ,K | Create new window up |
| ,A or ,H | Create new window left |
| ,S or ,J | Create new window down |
| ,D or ,L | Create new window right |
| ,f | Toggle file tree |
| ,F | Find current file in file tree |
| ,p | Fuzzy file find |
| ,P | Fuzzy file find (modified files) |
| ,m | Open command shortcuts reference file |
| ,? | ag (ack) |
| ,i | Toggle syntax check mode |
| ,I | Strip trailing whitespace |
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
| ,o | Open in file system (OS X) |
| ,[1-9] | Navigate to tab _num_ |
| ,0 | Navigate to last tab |
| ,` | Move focus between windows |
| ,. | Jump to definition of item under cursor (JavaScript) |
| ,> | Find refererences to item under cursor (JavaScript) |
| ,gd | Compare staged changes against master |
| ,gh | View file on Github |
| ,gH | Copy Github file URL to clipboard |
| ,gs | `git status` |
| ,gb | `git blame` |
| ,gc | `git commit` |
| ,gp | `git pull` |
| ,gu | `git push` |

## Vim Changelog

1.29.16
- Updated color scheme to customized variant of 'Alduin'.

7.28.15
- Added 'vim-signature' plugin to display marks in gutter.

7.23.15
- Resolve issue where mouse selection did not work past a certain column (~220).

7.22.15
- Added 'term_for_vim' for enhanced autocompletion and code understanding.
- `,.` binding now uses Tern to locate definitions.
- Added `,>` binding to find references to item under cursor via Tern.
- Ensure that custom Vim configuration file exists before sourcing it.

7.19.15
- Added window management bindings.
  - `w`, `a`, `s`, `d`, `h`, `j`, `k` and `l` will move focus between windows in supplied direction.
  - `W`, `A`, `S`, `D`, `H`, `J`, `K` and `L` will create windows in supplied direction.
  - Added Colemak variable which will substitute appropriate bindings for `w`, `a`, `s` and `d`.
- Added 'vim-rooter' plugin to help set appropriate project root (makes 'ack' and 'ag' more useful).
- Added `,F` binding to find current file within file tree.
- Added `,.` binding to attempt to go to function definition for selected text.
- Changed `,a` ('ack' and 'ag') mapping to `,?`.
- Changed `,s` (toggle syntax check mode) mapping to `,i`.
- Changed `,w` (strip trailing whitespace) mapping to `,I`.
- Update fuzzy finder default action for `enter` to open in current window.

6.18.15
- Add `.vimrc-custom` file for overrides to be sourced by main.

6.3.15
- Jump to end of line when yanking and pasting.
- Typo correction for ‘q:’.
- Provide zsh binding for switching to foreground application `Ctrl-Z`.
- Paste over selection without yanking removed text.

5.25.15
- Updated code fold settings.

5.19.15
- Show tab number in tabline as opposed to number of splits (default).
- Don't show buffers in tabline.
- Don't show "close" trigger in tabline.

4.2.2015
- The `%` operator will now take you to matching HTML tags and more.
- Auto closing brackets, quotes, parenthesis.
- Auto indentation on block definitions.

3.29.15
- Disable Syntastic by default. Update binding to toggle mode.

3.2.15
- Added 'vim-shot-f' to plugin list.
- Write as root binding `w!!`.
- Added shortcuts for copy and cut.
- Updated comment block binding `,/`.
- Open in OS binding `,o`.
- Save session and quit binding `,Q`.

2.4.15
- `;;` exits insert mode instead of `ii`.
- Backup, swap and undo files have been moved out of working directory to their own locations in ‘~/.vim/‘. These directories will automatically be created if they do not yet exist.
- Saved Vim session file now gets saved to ‘~/.vim/‘ instead of working directory.
- Added ‘vimsurround’ for quick highlighting.

1.27.15
- `[space]` enters insert mode.
- `ii` exits insert mode.
- `,Q` will save session, save files and exit Vim. Session can be reopened with `vim -S`.
- Pressing [enter] or double clicking on a fuzzy finder entry will open it in a new tab as opposed to edit mode.
- Prefer ag (silver searcher) to ack when available.
- Prefer ag (silver searcher) in fuzzy finder when available.
- Added ag ignore file.
- Added ‘wildfire’ plugin for text selection.
- Mapped `//` to clear highlighted searches.

1.24.15
- Save when losing focus or switching buffers.
- Automatically reload files modified outside of Vim.
- Immediately apply changes to Vim configuration.
- `[enter]` will clear highlighted matches.
- Enable spellchecking for git commit messages.
- Highlight trailing whitespace as error in visual mode.
- Strip all whitespace key binding `,w`.
- Automatic indentation settings detection.
- Indentation size toggle `,|`.
- Set preferred backup, swap and undo locations (enables persistent undo).
- HTML5 completion support.
- Improved CSS3 Syntax.
- Improved JavaScript syntax.
- Improved JSON syntax.
- Write / quit command typo corrections
- Configuration file housekeeping
