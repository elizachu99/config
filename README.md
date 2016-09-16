# config

Custom configuration files for setting up environments:
* `.vimrc` and `.vim` folder
* `.bash_profile`
* `.cshrc`


## useful VIM commands
** favorites

### Window switching
* `vsp file.cpp` vertical split
* `C-w C-r` rotate windows
* `C-w C-w` switch windows
* `10 C-w+` increase window size by 10 lines
* `ls` show current buffers
* `bd` close buffer
* `2bd` close buffer #2
* `gf` open file under cursor

### Search and replace
* `%s/x/y/gc` replace x by y, ask for confirmation
* `s/x/y/g` current line only
* `%s/x/y/gi` case insensitive
* `n` next match
* `N` prev match
* `:noh` clear search highlight **

### Moving around
* `C-e` scroll down 1 line
* `C-y` scroll up 1 line
* `C-f` next page
* `C-b` previous page
* `zt` scroll cursor to top
* `zz` scroll cursor to middle **
* `zb` scroll cursor to bottom
* `gg` top of file
* `G` end of file
* `'.` jump to last change
* ``` `` ``` jump back **
* `gd` go to local definition **
* `gD` go to global definition **
* `#` previous occurence **
* `*` next occurence **
* `0` beginning of line
* `^` beginning of indent
* `$` end of line
* `w` next word
* `b` previous word
* `H` move to top
* `M` move to middle
* `L` move to bottom

### Editing
* `A` append at end of line
* `dd` delete current line
* `d10d` delete 10 lines
* `dG` delete to EOF
* `yy` copy current line
* `p` paste
* `"ayy` copy line to buffer `a` **
* `"ap` paste from buffer `a` **
* `"a10yy` copy 10 lines to buffer `a`
* `u` undo
* `C-r` redo
* `~` toggle case
* `>` indent
* `<` un-indent
