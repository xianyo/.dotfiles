#!/bin/bash


CURRENT_DIR=`pwd`

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

echo "*********************************************"
echo "*********************************************"
echo "*************      VIM        ***************"
echo "*********************************************"
echo "*********************************************"

echo 
echo 

echo "Setting up files"
mv $HOME/.vim $HOME/.vim_bak >&/dev/null
mv $HOME/.vimrc $HOME/.vimrc_bak >&/dev/null
lnif $CURRENT_DIR/vim/vimrc $HOME/.vimrc
lnif "$CURRENT_DIR/vim" "$HOME/.vim"

echo "Install vundle"
if [ ! -e $CURRENT_DIR/vim/bundle/vundle ]; then
    echo "Installing vim vundle"
    git clone https://github.com/gmarik/vundle.git $CURRENT_DIR/vim/bundle/vundle
else
    echo "Upgrade vim vundle"
    cd "$HOME/.vim/bundle/vundle" && git pull origin master
fi

echo "Update/Install vim plugins using Vundle"
system_shell=$SHELL
export SHELL="/bin/sh"
echo "installing ...." > xianyovim
echo "sucess auto exit" >> xianyovim
echo "please wait" >> xianyovim
vim xianyovim +BundleInstall! +BundleClean +qall
rm xianyovim
export SHELL=$system_shell

#vim bk and undo dir
if [ ! -d /tmp/vimbk ]
then
    mkdir -p /tmp/vimbk
fi

if [ ! -d /tmp/vimundo ]
then
    mkdir -p /tmp/vimundo
fi

echo 
echo

echo "VIM Install Done!"

echo 
echo

echo "*********************************************"
echo "*********************************************"
echo "*************      emacs        *************"
echo "*********************************************"
echo "*********************************************"

mv $HOME/.spacemacs $HOME/.spacemacs_bak >&/dev/null
mv $HOME/.spacemacs.d $HOME/.spacemacs.d_bak >&/dev/null

lnif "$CURRENT_DIR/spacemacs.d" "$HOME/.spacemacs.d"

echo "Install Spacemacs"
if [ ! -f $HOME/.emacs.d/spacemacs.mk ]; then
    mv $HOME/.emacs.d $HOME/.emacs.d_bak >&/dev/null
    echo "Cloneing Spacemacs"
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
else
    echo "Upgrade Spacemacs"
    cd "$HOME/.emacs.d" && git pull 
fi

mv $HOME/.spacemacs $HOME/.spacemacs_bak >&/dev/null

emacs -nw

echo 
echo

echo "Spacemacs Install Done!"

echo 
echo

echo "*********************************************"
echo "*********************************************"
echo "*************      bash         *************"
echo "*********************************************"
echo "*********************************************"

echo "Install autojump"
if [ ! -e $HOME/.autojumpgit ]; then
    echo "Cloneing autojump"
    git clone git@github.com:wting/autojump.git  ~/.autojumpgit
    cd ~/.autojumpgit
    python install.py >&/dev/null
else
    echo "Upgrade autojump"
    cd "$HOME/.autojumpgit" && git pull 
    python install.py >&/dev/null 
fi

echo "Install autojump ok"

grep ". $CURRENT_DIR/bashrc" $HOME/.bashrc >/dev/null
if [ $? -eq 0 ]; then
    echo "Found! no add"
else
    echo "Not found! and add!"
    echo ". $CURRENT_DIR/bashrc" >> $HOME/.bashrc
fi

echo 
echo

echo "bash config Install Done!"

echo 
echo

echo "ok"




