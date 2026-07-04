# --- History ---
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000

setopt EXTENDED_HISTORY       # store timestamp + duration
setopt INC_APPEND_HISTORY     # write immediately, not just on shell exit
setopt SHARE_HISTORY          # share across all open terminals live
setopt HIST_IGNORE_DUPS       # don't record a line if same as previous
setopt HIST_IGNORE_ALL_DUPS   # remove older dup when a new one is added
setopt HIST_FIND_NO_DUPS      # skip dups when searching/scrolling
setopt HIST_IGNORE_SPACE      # commands starting with a space aren't recorded
setopt HIST_REDUCE_BLANKS
