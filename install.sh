#!/bin/bash

if [ -f ~/.vimrc ];
then
  echo ".vimrc already exists in home directory";
else
  ln -s ~/.vim/vimrc ~/.vimrc
fi

if [ -d ~/.tmuxinator/ ];
then
  echo ".tmuxinator folder already exists";
else
  ln -s ~/.linux_setup/tmuxinator ~/.tmuxinator
fi

if [ -f ~/.tmux.conf ];
then
  echo "tmux.conf already exists in home dir";
else
  ln -s ~/.linux_setup/tmux.conf ~/.tmux.conf
fi

if grep -q "source ~/.linux_setup/profile" "../.profile";
then
  echo ".profile already contains source to linux_setup bashrc"
else
  echo "source ~/.linux_setup/profile" >> ~/.profile
fi

if grep -q "source ~/.linux_setup/bashrc" "../.bashrc";
then
  echo ".bashrc already contains source to linux_setup bashrc"
else
  echo "source ~/.linux_setup/bashrc" >> ~/.bashrc
fi

if grep -q "source ~/.linux_setup/zshrc" "../.zshrc";
then
  echo ".zshrc already contains source to linux_setup zshrc"
else
  echo "source ~/.linux_setup/zshrc" >> ~/.zshrc
fi

git config --global core.excludesfile ~/.linux_setup/.gitignore_global

sudo apt-get install silversearcher-ag
sudo apt-get install exuberant-ctags
sudo apt-get install tmux
sudo apt-get install xclip
gem install tmuxinator -v 0.6.9
