echo $SHELL 

# update
sudo apt update

# install zsh
sudo apt install zsh curl git snap powerline fonts-powerline autojump -y
sudo snap install nvim --classic

# Change the default login shell to zsh
chsh -s $(which zsh) $(whoami)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k zsh-syntax-highlighting zsh-autosuggestions
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup
fi
cp .zshrc ~/.zshrc