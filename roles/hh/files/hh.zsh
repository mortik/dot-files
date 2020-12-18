export HISTCONTROL=ignoredups:ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export HISTFILE=~/.zsh_history   # ensure history file visibility

export HH_CONFIG=hicolor         # get more colors
bindkey -s "\C-r" "\eqhh\n"      # bind hh to Ctrl-r (for Vi mode check doc)
