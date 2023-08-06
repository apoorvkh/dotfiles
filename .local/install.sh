#!/usr/bin/env bash

cd ~

git init -b main
git remote add origin https://github.com/apoorvkh/dotfiles.git
git fetch
git checkout origin/main -ft
git submodule update --init --recursive
git remote set-url origin git@github.com:apoorvkh/dotfiles.git

source ~/.local/bin/micromamba-init

mamba env update --prefix ~/.local/miniconda3 --file $CONDA_BASE_YAML --prune
mamba clean --all --quiet --yes

# oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | ZSH=~/.zsh/oh-my-zsh KEEP_ZSHRC=yes CHSH=no RUNZSH=no bash -s --
