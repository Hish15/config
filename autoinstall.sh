#################################################################################
# This script install all the good things I like and want on any ubuntu
#################################################################################
# Neovim
git clone https://github.com/neovim/neovim.git ~/neovim
cd ~/neovim
git checkout -f stable
mkdir build
cmake -B build -DCMAKE_BUILD_TYPE=Release -GNinja
ninja -C build
sudo ninja -C build install

#################################################################################
# tmux
sudo apt-get install tmux
cd ~
ln -s .config/.tmux.conf .tmux.conf
#Installing tmux manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#################################################################################
#installing CCLS LSP server for nvim
#dependencies
sudo apt-get install zlib1g-dev libncurses-dev clang libclang-dev
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
