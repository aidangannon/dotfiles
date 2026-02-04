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

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/opt/nvim-linux-x86_64/bin:/opt/nvim/bin:$PATH"
export PATH="/usr/local/bin/tmux:$PATH"
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$HOME/.dotnet:$PATH

if [[ "$OSTYPE" == "darwin"* ]]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh
    source $(brew --prefix)/opt/fzf/shell/completion.zsh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

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

echo -e "\033[1;37m"
echo "                                                          "
echo "                                                          "
echo "                            oMMMMo                            "
echo "                    'MMMMM.         MMMMM'                    "
echo "                 WMM,                    ,MMM                 "
echo "              dMM                            MMx              "
echo "            kMx                                xMk            "
echo "          ,M0                                    0M;          "
echo "         xM,   KMMMMMMMMMMMMMMMMMMMMMM:           'Mk         "
echo "        kM.   lMMMMMMMMMMMMMMMMMMMMMMMMO           .MO        "
echo "       oM'     0MMMMMMMMMl   MMMMMMMMMMMc           .Mo       "
echo "      .Md                  .MMMMMMMMMMMMM.           oM.      "
echo "      dM                  ,MMMMX dMMMMMMMW            Mx      "
echo "      XK                 cMMMMM    MMMMMMMk           KX      "
echo "      WO                xMMMMMMO    KMMMMMM:          OW      "
echo "      XK               0MMMMMMx      oMMMMMM.         KX      "
echo "      dM.             NMMMO           ,MMMMMX         Mx      "
echo "      .Md            MMMM               MMMMMx       oM.      "
echo "       oM'          0MM;                 0MMMM;     .Mo       "
echo "        kM.                               lMMMM    .MO        "
echo "         xM,                               'MMMc  ,Mk         "
echo "          ,MK                                    0M,          "
echo "            xMk                                xMk            "
echo "              dMM                            MMd              "
echo "                 WMM;                    ;MMW                 "
echo "                    .MMMMM.        .MMMMM.                    "
echo "                            'MMMM'                            "
echo -e "\033[1;32m🚩 Wired In\033[0m"
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
