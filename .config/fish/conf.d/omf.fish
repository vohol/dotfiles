# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

set TERM "xterm-256color"
set EDITOR "gnome-text-editor"
set fish_greeting


###ALIASES###

#options
alias neo='neofetch' #neofetch
alias c='clear'
alias vimhelp='cat neovim-cheets.txt' #open in terminal vim commands
alias sassw='sass scss/style.scss css/style.css --watch'

#to create parent directories as needed (if parent do not already exits) and to display a message for each created directory
alias mkdir='mkdir -pv'

#to display a message for each removed directory
alias rm='rm -v'


# vim and emacs
alias vim='nvim'
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"
alias emacs="emacsclient -c -a 'emacs'"

# Changing "ls" to "exa"
alias ls='exa -1 --color=always --group-directories-first' # my preferred listing

# to go to directories and then show folders & files inside 
function cd 
  command cd $argv; tree -L 1 $argv
end

