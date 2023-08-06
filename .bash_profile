if [[ -x "$HOME/envs/_base/bin/zsh" ]]; then
    export SHELL=$HOME/envs/_base/bin/zsh
    exec $SHELL -l
fi
