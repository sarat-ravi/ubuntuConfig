cd ~/
sudo apt-get install vim
echo "Installing vim..."

git clone git@github.com:sarattall/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

