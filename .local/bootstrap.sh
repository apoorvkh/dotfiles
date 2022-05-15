curl -o ./install_miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ./install_miniconda.sh -b -p $HOME/.local/miniconda3
rm ./install_miniconda.sh

export PATH=$HOME/.local/miniconda3/bin:$PATH
conda install mamba git -c conda-forge --yes

# .dotfiles
git init
git remote add origin https://github.com/apoorvkh/dotfiles.git
git fetch
git checkout origin/main -ft
git submodule update --init --recursive
git remote set-url origin git@github.com:apoorvkh/dotfiles.git

mamba env update --prefix ~/.local/miniconda3 --file ~/.conda/base.yml --prune
mamba clean --all --quiet --yes
source ~/.conda/condabin_symlinks.sh

# oh-my-zsh
PATH=$PATH ZSH=~/.zsh/oh-my-zsh KEEP_ZSHRC=yes CHSH=no RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# AWS CLI
# when available, add to conda env: https://github.com/aws/aws-cli/issues/6785
# sudo apt-get install unzip -y
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# ./aws/install -i $HOME/.local/aws-cli -b $HOME/.local/bin
# rm -r aws awscliv2.zip
