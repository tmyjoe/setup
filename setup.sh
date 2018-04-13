#!/bin/bash

echo 'Hello! new Mac!'
cd ~
echo 'generate keypair?[Y/n]'
read ANSWER

case $ANSWER in
  "" | "Y" | "y" )
    ssh-keygen;;
  * ) echo "generate keypair skip";;
esac

echo 'install homebrew?[Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";;
  * ) echo "install homebrew skip";;
esac

echo 'install ansible?[Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    brew install python
    brew install ansible
    rehash;;
  * ) echo "install ansible skip";;
esac

echo 'run ansible?[Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    cd ~/dotfile
    HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook -i hosts -vv localhost.yaml;;
  * ) echo "run ansible skip";;
esac

echo 'new Mac setup finished!! Please run chsh /bin/zsh'
