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

# bash prompt
BLACK="\[\e[0;30m\]" # normal
BBLACK="\[\e[1;30m\]" # bold
BGBLACK="\[\e[40m\]" # background
RED="\[\e[0;31m\]"
BRED="\[\e[1;31m\]"
BGRED="\[\e[41m\]"
GREEN="\[\e[0;32m\]"
BGREEN="\[\e[1;32m\]"
BGGREEN="\[\e[42m\]"
YELLOW="\[\e[0;33m\]"
BYELLOW="\[\e[1;33m\]"
BGYELLOW="\[\e[43m\]"
BLUE="\[\e[0;34m\]"
BBLUE="\[\e[1;34m\]"
BGBLUE="\[\e[44m\]"
MAGENTA="\[\e[0;35m\]"
BMAGENTA="\[\e[1;35m\]"
BGMAGENTA="\[\e[45m\]"
CYAN="\[\e[0;36m\]"
BCYAN="\[\e[1;36m\]"
BGCYAN="\[\e[46m\]"
WHITE="\[\e[0;37m\]"
BWHITE="\[\e[1;37m\]"
GRAY="\[\e[0;37m\]"
BGGRAY="\[\e[47m\]"
# http://bitmote.com/index.php?post/2012/11/19/Using-ANSI-Color-Codes-to-Colorize-Your-Bash-Prompt-on-Linux
SOFTPURPLE="\[\e[38;5;183m\]" # Uses 256 colors, the "XXm" specifies which color. Range: 0~255
GOODYELLOW="\[\e[38;5;220m\]"
GRASSGREEN="\[\e[38;5;40m\]"
SOFTBLUE="\[\e[38;5;111m\]"
LIGHTBLUE="\[\e[38;5;123m\]"
BLIGHTBLUE="\[\e[1;38;5;123m\]" # Bolded
export PS1="${SOFTPURPLE}\u${BLUE}@${SOFTPURPLE}\h${SOFTBLUE}[\t]${BLUE}:${LIGHTBLUE}\w\n${BRED}$ ${WHITE}"

# put this in your .bash_profile
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ';
fi

# aliases
source $HOME/.bash_aliases

# add ~/bin to PATH
export PATH=$PATH:$HOME/bin

# default editor
export EDITOR=vi


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

#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
    cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

