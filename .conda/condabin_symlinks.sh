#!/usr/bin/env bash

if [[ "$(uname -s)" == 'Linux' ]]; then
    for binary in git zsh pdftex gpg git-secret zip gdown tensorboard tmux
    do
        if [[ -a ~/.local/miniconda3/bin/$binary ]]; then
            ln -sf ~/.local/miniconda3/bin/$binary ~/.local/miniconda3/condabin/$binary;
        fi
    done
fi
