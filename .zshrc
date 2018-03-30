# set locales to your needs
export LC_ALL="hu_HU.UTF-8"
export LANG="hu_HU.UTF-8"
export LANGUAGE="hu_HU.UTF-8"

# set up colors for terminal
[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

# automatically attach to tmux session with read only flag
tmux attach -r

# if you do detach_smallest the terminal of the smallest client will be force disconnecded
detach_smallest(){ tmux detach -t$(tmux list-clients |awk -F'[:[x ]' 'BEGIN {l=99999}{s=$5*$6;if (s<l){l=s;t=$1}} END{print t}'); }
