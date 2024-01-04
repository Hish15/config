#################################################################################
# This script install all the good things I like and want on any ubuntu
#################################################################################
#Install zsh and oh my zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt-get install -y cmake ninja-build
#for ssh autostart
sudo apt-get install -y keychain
# Neovim
mkdir bin
curl -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz | tar -xvz -C ~/bin/
cd /usr/local/bin
sudo cp -s ~/nvim-linux64/bin/nvim .

#################################################################################
# tmux
sudo apt-get install -y tmux
cd ~
ln -s .config/.tmux.conf .tmux.conf
#Installing tmux manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#################################################################################
#install fd (find alternative)
sudo cargo install fd-find
#################################################################################
#install ripgrep
sudo cargo install ripgrep
#################################################################################
