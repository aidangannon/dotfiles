[[ $- != *i* ]] && return

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt SHARE_HISTORY

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH="/opt/nvim-linux-x86_64/bin:/opt/nvim/bin:$PATH"
export PATH="/usr/local/bin/tmux:$PATH"
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$HOME/.dotnet:$PATH

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

bindkey -v
export KEYTIMEOUT=1

function zle-line-init zle-keymap-select {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;
        viins|main) echo -ne '\e[5 q';;
    esac
}
zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz compinit
compinit

eval "$(starship init zsh)"

alias ll='ls -alF'
alias git-up='git push --set-upstream origin'
alias git-rollback='git reset --hard'
alias netdbg='netcoredbg --interpreter=cli --attach'
alias nettest='dotnet test --filter '
alias nettest-dbg='VSTEST_HOST_DEBUG=1 dotnet test --filter '
alias netcoredbg="/usr/local/bin/netcoredbg/netcoredbg"

echo -e "\033[1;36m"
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║                                                           ║"
echo "║        █████╗ ██╗██████╗  █████╗ ███╗   ██╗               ║"
echo "║       ██╔══██╗██║██╔══██╗██╔══██╗████╗  ██║               ║"
echo "║       ███████║██║██║  ██║███████║██╔██╗ ██║               ║"
echo "║       ██╔══██║██║██║  ██║██╔══██║██║╚██╗██║               ║"
echo "║       ██║  ██║██║██████╔╝██║  ██║██║ ╚████║               ║"
echo "║       ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝               ║"
echo "║                                                           ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo -e "\033[0m"
echo -e "\033[1;33m👤 User:\033[0m $(whoami)"
echo -e "\033[1;33m📅 Date:\033[0m $(date '+%A, %B %d, %Y - %I:%M %p')"
echo -e "\033[1;33m💻 Host:\033[0m $(hostname)"
echo -e "\033[1;32m🚩 Wired In Dawggg\033[0m"
echo ""

ydle() {
    tmux split-window -h -p 20 -c "$current_dir" \; \
        split-window -v -p 35 \; \
        select-pane -t 0 \; \
        split-window -v -p 15 -c "$current_dir" \; \
        select-pane -t 0 \; \
        send-keys -t 0 "nvim" C-m \; \
        send-keys -t 2 "cd $(pwd) && clear" C-m \; \
        send-keys -t 3 "cd ~ && clear" C-m \; \
        send-keys -t 1 "cd $(pwd) && claude --permission-mode plan" C-m
}
