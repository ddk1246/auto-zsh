CNT="[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"
INSTLOG="install.log"

echo -e "$CNT - Current Shell: $SHELL, it will be [\e[1;32mZSH\e[0m]"

read -n1 -rep $'[\e[1;33mACTION\e[0m] - Would you like to continue with the install [Y/n] ' INST
if [[ $INST == "Y" || $INST == "y" || $INST == "" ]]; then
    echo -e "$COK - Starting install script.."
else
    echo -e "$CNT - This script would now exit, no changes were made to your system."
    exit
fi

# update
echo -e "$CNT - Update apt"
sudo apt update
echo -e "$COK - Finish Update apt\n"

# install zsh
echo -e "$CNT - Install zsh"
sudo apt install zsh curl git powerline fonts-powerline autojump -y
echo -e "$COK - Finish install zsh\n"

# copy custom config
if [ -f ~/.zshrc ]; then
    echo -e "$CWR Save current config [~/.zshrc] To [~/.zshrc.backup]"
    mv ~/.zshrc ~/.zshrc.backup
fi
echo -e "$CAC - Copy custom .zshrc to ~/.zshrc"
cp .zshrc ~/.zshrc

# install oh-my-zsh
echo -e "$CNT - Install oh-my-zsh\n"
if KEEP_ZSHRC=yes RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
    echo -e "$COK - Finish install oh-my-zsh\n"
else
    echo -e "$CER - Install oh-my-zsh failed.\n"
    exit 1  # Exit with a non-zero status to indicate an error
fi

# install powerlevel10k zsh-syntax-highlighting zsh-autosuggestions
echo -e "$CNT - Install extensions"
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &>> $INSTLOG
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &>> $INSTLOG
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &>> $INSTLOG
echo -e "$COK - Finish clone powerlevel10k zsh-syntax-highlighting zsh-autosuggestions \n"

zsh -l