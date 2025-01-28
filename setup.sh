echo "Installing for termux"
echo "Updating packages"
apt update && apt upgrade && apt update
apt install git neovim tmux zsh stow zoxide which fzf wget starship
echo "${BLUE}Trying to install FiraCode Nerd Font"
mkdir ~/.termux
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/SemiBold/FiraCodeNerdFontMono-SemiBold.ttf -O ~/.termux/font.ttf
wget https://raw.githubusercontent.com/catppuccin/termux/main/themes/catppuccin-macchiato.properties -O ~/.termux/colors.properties
echo "Settting Zsh as default shell"
chsh -s zsh

echo "creating links for .config"

stow nvim tmux zsh starship

if [ -d "~/.tmux/plugins/tpm" ]; then
  echo "Tmux Plugin Manager TPM is already installed."
else
  echo "${RESET}Installing tmux plugin manager"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Installation is complete"
