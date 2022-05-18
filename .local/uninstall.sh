cd ~

for fp in $(git ls-files); do
    rm -r $fp;
done

rm -rf ~/.zsh/oh-my-zsh
rm -rf ~/.local/miniconda3
rm -rf ~/.git
