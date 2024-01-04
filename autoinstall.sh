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
#installing CCLS LSP server for nvim
#dependencies
sudo apt-get install -y zlib1g-dev libncurses-dev clang libclang-dev
git clone --depth=1 --recursive https://github.com/MaskRay/ccls ~/ccls
cd ~/ccls
#clang is needed
wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
cmake -H. -GNinja -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
sudo cmake --build Release --target install
#################################################################################
#install fd (find alternative)
sudo cargo install fd-find
#################################################################################
#install ripgrep
sudo cargo install ripgrep
#################################################################################
