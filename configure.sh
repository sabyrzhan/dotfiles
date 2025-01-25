set -e
profile=$1

# espanso
mkdir -p "$HOME/Library/Application Support/espanso"
cp -R configs/espanso/ "$HOME/Library/Application Support/espanso/"

# zsh, omz, powerlevel10k
echo "Copying shell configs..."
cp -i configs/shell/omz/.p10k.zsh $HOME/
cp -i configs/shell/zsh/.zshrc $HOME/
echo "Finished!"
echo "Now manually reconfigure p10k: p10k configure"

# karabiner
mkdir -p $HOME/.config/karabiner
cp -R configs/karabiner/ $HOME/.config/karabiner

# git configs
cp -R -i configs/git/ $HOME/
echo "Finished git config copy. WARNING: update your email and fullname in personal and work configs"