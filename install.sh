echo $SHELL 

# update
sudo apt update

# install zsh
sudo apt install zsh curl git powerline fonts-powerline autojump -y

# Change the default login shell to zsh
chsh -s $(which zsh) $(whoami)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k zsh-syntax-highlighting zsh-autosuggestions
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup
fi

# copy custom config
cp .zshrc ~/.zshrc

echo "Please manually exit the current shell to apply changes."
