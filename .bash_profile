if [[ -x "$HOME/.local/micromamba/envs/_base/bin/zsh" ]]; then
    export SHELL=$HOME/.local/micromamba/envs/_base/bin/zsh
    exec $SHELL -l
fi
