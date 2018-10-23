# set locales to your needs
export LC_ALL="hu_HU.UTF-8"
export LANG="hu_HU.UTF-8"
export LANGUAGE="hu_HU.UTF-8"

# set up colors for terminal
[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

# automatically attach to tmux session with read only flag
tmux attach -r
