set -e
profile=$1

# espanso
cp -r common/configs/espanso/ "$HOME/Library/Application Support/"
cp -r $profile/configs/espanso/ "$HOME/Library/Application Support/"

# zsh, omz, powerlevel10k
cp configs/shell/omz/.p10k.zsh $HOME/
cp configs/shell/zsh/.zshrc $HOME/