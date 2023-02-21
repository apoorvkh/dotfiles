export ZSH="$HOME/.zsh/oh-my-zsh"
export ZSH_COMPDUMP="$HOME/.cache/zcompdump-$HOST"

ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM="$HOME/.zsh/custom"

plugins=(command-not-found cp ssh-agent gpg-agent git git-prompt pip python sudo screen ubuntu docker docker-compose)
zstyle :omz:plugins:ssh-agent agent-forwarding yes

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/.local/machine/bin:$HOME/.local/scripts:$HOME/.local/bin:$PATH
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)

source $HOME/.aliases

load_env() {
    source $HOME/.local/bin/conda-init $1/.local/miniconda3
    export NLTK_DATA=${2:-$1}/.cache/nltk_data
    export HF_HOME=${2:-$1}/.cache/huggingface
}

load_env $HOME

export PATH=$HOME/.local/machine/bin:$PATH
source $HOME/.local/machine/rc

#

[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh

autoload -Uz quote-and-complete-word
zle -N quote-and-complete-word
bindkey '\t' quote-and-complete-word
