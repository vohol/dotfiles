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
alias gosleep='sudo dnf clean all && sudo dnf update -y && flatpak update && shutdown'
alias xampp='sudo /opt/lampp/lampp'

#to create parent directories as needed (if parent do not already exits) and to display a message for each created directory
alias mkdir='mkdir -pv'

#to display a message for each removed directory
alias rm='rm -v'


# vim and emacs
alias vim='nvim'

# Changing "ls" to "exa"
alias ls='exa -1 --color=always --group-directories-first' # my preferred listing

# to go to directories and then show folders & files inside
functions -c cd orig_cd # copies cd to orig_cd
function cd 
  orig_cd $argv; tree -L 1
  #cd $argv && tree -L 1
end

#automatic recursive copy for directories.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -i -r $from $to
    else
        command cp -i $argv
    end
end
