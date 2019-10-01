## All Aliases
# Folder views
alias lr='ls -Falrth'
alias lc='ls -1'

# Ala vim commands
alias :x='exit'

# Loading tensorflow (virtualenv CPU)
alias tensorflow='source ~/venv/bin/activate'

# Add my own custom commands
export PATH=$PATH":$HOME/CustomOS/myBashCommands"

# Remote SSH to desktop
alias ryzen='ssh -XY 2.154.25.247'
# Alias for usual commands
alias tmus='tmux new-session -s'
alias tmut='tmux attach -t'

# Open fzf found file in nvim
alias vimf='vim -o `fzf`'
