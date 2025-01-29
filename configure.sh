set -e
profile=$1

# espanso
mkdir -p "$HOME/Library/Application Support/espanso"
cp -R configs/espanso/ "$HOME/Library/Application Support/espanso/"
echo "Finish espanso files copy!"

# zsh, omz, powerlevel10k
echo "Copying shell configs..."
cp -i configs/shell/omz/.p10k.zsh $HOME/ || true
cp -i configs/shell/zsh/.zshrc $HOME/ || true
echo "Finished zsh files copy!"
echo "Now manually reconfigure p10k: p10k configure"

# karabiner
mkdir -p $HOME/.config/karabiner
cp -R configs/karabiner/ $HOME/.config/karabiner
echo "Finished karabiner files copy!"

# git configs
cp -R -i configs/git/ $HOME/
echo "Finished git config copy. WARNING: update your email and fullname in personal and work configs"