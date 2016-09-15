# allow display of Russian/Japanese characters
# Edit 2016/6/28: this causes terminal to display in Russian (ex. "cal" command)
# so I turned it off. If display of special characters needed, uncomment it 
# and source this profile by command: $ source ~/.bash_profile
#export LANG=ru_RU.UTF-8

# allow input of accents/Chinese/Japanese etc.
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

# color schemes
export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

# aliases
alias ll="ls -lh --color"
alias grep 'grep -n -i --color=always'
alias rm 'rm -v'

# put this in your .bash_profile
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ';
fi

# Piece-by-Piece Explanation:
# the if condition makes sure we only screw with $PROMPT_COMMAND if we're in an iTerm environment
# iTerm happens to give each session a unique $ITERM_SESSION_ID we can use, $ITERM_PROFILE is an option too
# the $PROMPT_COMMAND environment variable is executed every time a command is run
# see: ss64.com/bash/syntax-prompt.html
# we want to update the iTerm tab title to reflect the current directory (not full path, which is too long)
# echo -ne "\033;foo\007" sets the current tab title to "foo"
# see: stackoverflow.com/questions/8823103/how-does-this-script-for-naming-iterm-tabs-work
# the two flags, -n = no trailing newline & -e = interpret backslashed characters, e.g. \033 is ESC, \007 is BEL
# see: ss64.com/bash/echo.html for echo documentation
# we set the title to ${PWD##*/} which is just the current dir, not full path
# see: stackoverflow.com/questions/1371261/get-current-directory-name-without-full-path-in-bash-script
# then we append the rest of $PROMPT_COMMAND so as not to remove what was already there
# voilà!
# Note by Eli 2016/6/28: deleted \007"; ':"$PROMPT_COMMAND"; part, or else everytime you source
# it will attempt to append echo... to PRMOPT_COMMAND, so you get multiple echos and there will be errors 
