export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=""
export ZSH_COMPDUMP="$HOME/.cache/zcompdump"

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=()
# plugins=(command-not-found cp ssh-agent gpg-agent git git-prompt pip python sudo screen ubuntu docker docker-compose)
# zstyle :omz:plugins:ssh-agent agent-forwarding yes

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/.local/machine/bin:$HOME/.local/bin:$PATH
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)
source $HOME/.aliases

source $HOME/.local/bin/micromamba-init
micromamba activate _base

set_cache() {
    export NLTK_DATA=$1/nltk_data
    export TORCH_HOME=$1/torch
    export HF_HOME=$1/huggingface
    export CONDA_PKGS_DIRS=$1/conda_pkgs
}

set_cache $HOME/.cache

eval "$(starship init zsh)"

autoload -Uz quote-and-complete-word
zle -N quote-and-complete-word
bindkey '\t' quote-and-complete-word

source $HOME/.local/machine/rc
