#!/usr/bin/env bash

cd ~

## Install conda

if [[ "$(uname -s)" == 'Linux' ]]; then
    export CONDA_INSTALL_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    export CONDA_BASE_YAML=~/.conda/base.yml
elif [[ "$(uname -s)" == 'Darwin' ]]; then
    export CONDA_INSTALL_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    export CONDA_BASE_YAML=~/.conda/base-osx.yml
fi

curl -o ./install_miniconda.sh $CONDA_INSTALL_URL
bash ./install_miniconda.sh -b -p ~/.local/miniconda3
rm ./install_miniconda.sh

export PATH=~/.local/miniconda3/bin:$PATH
conda install mamba git -c conda-forge --yes

## .dotfiles

git init -b main
git remote add origin https://github.com/apoorvkh/dotfiles.git
git fetch
git checkout origin/main -ft
git submodule update --init --recursive
git remote set-url origin git@github.com:apoorvkh/dotfiles.git

mamba env update --prefix ~/.local/miniconda3 --file $CONDA_BASE_YAML --prune
mamba clean --all --quiet --yes
source ~/.conda/condabin_symlinks.sh

# oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | ZSH=~/.zsh/oh-my-zsh KEEP_ZSHRC=yes CHSH=no RUNZSH=no bash -s --
