# Dotfiles

```
cp ~/.dotfiles/.gitconfig ~/.gitconfig
# Don't forget to update 'name' and 'email'

cp ~/.dotfiles/.profile ~/.profile

ln -s ~/.dotfiles/.vimrc ~/.vimrc

mkdir ~/.vim
mkdir ~/.vim/colors
ln -s ~/.dotfiles/.vim/opinions.vim ~/.vim/opinions.vim
ln -s ~/.dotfiles/.vim/colors/qqzellner.vim ~/.vim/colors/qqzellner.vim

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.hammerspoon ~/.hammerspoon
```
