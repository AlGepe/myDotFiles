# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## All my Aliases
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
alias fprev='fzf --preview "bat --style=numbers --color=always {}"'

# Shorcuts
alias workdir='cd ~/OmniSnippets_JS/AlStuff'
alias omni='cd ~/OmniSnippets_JS'
alias master='cd ~/Master'
