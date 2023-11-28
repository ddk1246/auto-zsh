echo $SHELL 

# update
sudo apt update

# install zsh
sudo apt install zsh curl git -y
sudo snap install nvim --classic

# Change the default login shell to zsh
chsh -s $(which zsh)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install font
sudo apt install powerline fonts-powerline -y

# install powerlevel10k
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install autojump
sudo apt install autojump -y

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

mv ~/.zshrc ~/.zshrc.backup
cp .zshrc ~/.zshrc