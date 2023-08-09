#!/usr/bin/env bash

# dotfiles

cd ~

export DOTFILES_BRANCH="${1:-main}"
git init -b $DOTFILES_BRANCH
git remote add origin https://github.com/apoorvkh/dotfiles.git
git fetch
git checkout origin/$DOTFILES_BRANCH -ft
git remote set-url origin git@github.com:apoorvkh/dotfiles.git
unset DOTFILES_BRANCH

# micromamba

export MAMBA_ROOT_PREFIX="$HOME/.local/micromamba"
export CONDA_PKGS_DIRS=$HOME/.cache/conda/pkgs
eval "$(~/.local/bin/micromamba shell hook -s posix)"
micromamba create -f ~/.environment.yml
micromamba clean --all --quiet --yes
micromamba activate _base

# oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | ZSH=~/.oh-my-zsh KEEP_ZSHRC=yes CHSH=no RUNZSH=no bash -s --
