#################################################################################
# This script install all the good things I like and want on any ubuntu
#################################################################################
#Install zsh and oh my zsh
if ! command -v zsh
then
    echo "installing zsh"
    sudo apt install zsh -y
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "zsh already installed"
fi

#get my configs
git clone https://github.com/Hish15/config.git ~/.config
ln -s ~/.config/.zshrc .
ln -s ~/.config/.gitconfig .

source ~/.zshrc
#zsh plugins : 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo apt-get install -y cmake ninja-build tldr
#for ssh autostart
sudo apt-get install -y keychain
# Neovim
mkdir bin
curl -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz | tar -xvz -C ~/bin/
cd /usr/local/bin
sudo ln -s ~/nvim-linux64/bin/nvim .

#Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
#################################################################################
# tmux
sudo apt-get install -y tmux
ln -s ~/.config/.tmux.conf .tmux.conf
#Installing tmux manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#################################################################################
#Installing cargo for rust tools
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#install fd (find alternative)
sudo cargo install fd-find
#################################################################################
#install ripgrep
sudo cargo install ripgrep
#################################################################################
#Install nvm and node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# download and install Node.js
nvm install 20
# verifies the right Node.js version is in the environment
node -v # should print `v20.12.2`
# verifies the right NPM version is in the environment
npm -v # should print `10.5.0`
