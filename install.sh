#!/usr/bin/env zsh

set -e
echo "Installing brews..."
brew bundle install --file=$PWD/Brewfile
echo ""

echo "Installing fnm..."
eval "$(fnm env --use-on-cd --shell zsh)"
fnm install --lts && fnm use lts-latest
echo ""

# omz install, powerlevel10k theme install
echo "Installing zsh configs..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k || true
echo ""

# supdock
echo "Installing supdock..."
npm install -g supdock
echo ""

#shothand fubectl
echo "Installing fubectl..."
curl -L https://rawgit.com/kubermatic/fubectl/master/fubectl.source -o $HOME/fubectl.source
echo "Installing krew..."

#krew
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
echo ""
echo "Finished installation!"

# sdkman
echo "Installing sdkman..."
curl -s "https://get.sdkman.io" | bash
echo "Finishing installing sdkman!"
