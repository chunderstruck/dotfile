
echo
echo -n "Would you like to backup your current dotfiles? (y/n) "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    mv ~/.zshrc ~/.zshrc.bak
    mv ~/.tmux.conf ~/.tmux.conf.bak
#    mv ~/.vimrc ~/.vimrc.bak
else
    echo -e "\nNot backing up old dotfiles."
fi

ln -s $HOME/dotfiles/.zshrc ~/.zshrc
ln -s $HOME/dotfiles/.tmux.conf ~/.tmux.conf




