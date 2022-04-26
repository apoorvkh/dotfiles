#!/bin/env bash

for binary in git zsh pdftex gpg git-secret
do
    if [[ -a ~/.local/miniconda3/bin/$binary ]]; then
        ln -sf ~/.local/miniconda3/bin/$binary ~/.local/miniconda3/condabin/$binary;
    fi
done
