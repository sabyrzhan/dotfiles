set -e
profile=$1

# espanso
mkdir -p "$HOME/Library/Application Support/espanso"
cp -r configs/espanso/ "$HOME/Library/Application Support/espanso"
cp -r configs/espanso/ "$HOME/Library/Application Support/espanso"

# zsh, omz, powerlevel10k
cp configs/shell/omz/.p10k.zsh $HOME/
cp configs/shell/zsh/.zshrc $HOME/