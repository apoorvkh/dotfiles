export ZSH="$HOME/.zsh/oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_CUSTOM="$HOME/.zsh/custom"

plugins=(command-not-found cp ssh-agent gpg-agent git git-prompt pip python sudo screen ubuntu docker docker-compose)
zstyle :omz:plugins:ssh-agent agent-forwarding yes

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/.local/bin:$PATH
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)

source $HOME/.aliases
source $HOME/.local/bin/conda-init

#

[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh

autoload -Uz quote-and-complete-word
zle -N quote-and-complete-word
bindkey '\t' quote-and-complete-word
