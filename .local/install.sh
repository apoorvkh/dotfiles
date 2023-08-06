#!/usr/bin/env bash

# dotfiles

cd ~

export BRANCH="${1:-main}"
git init -b $BRANCH
git remote add origin https://github.com/apoorvkh/dotfiles.git
git fetch
git checkout origin/$BRANCH -ft
git remote set-url origin git@github.com:apoorvkh/dotfiles.git

# micromamba

export MAMBA_ROOT_PREFIX="$HOME"
eval "$(~/.local/bin/micromamba shell hook -s posix)"

micromamba create -f ~/.environment.yml

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
