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
git clone https://github.com/sharkdp/fd ~/fd
cd ~/fd
cargo build
sudo cargo install
#################################################################################
#install ripgrep
mkdir ~/ripgrep
cd ~/ripgrep
wget https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
#################################################################################
