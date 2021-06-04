#!/bin/bash

ROOT=$(pwd)/../
HERE=$(pwd)


# ----------- INSTALL  ----------- #
# Thanks to Etienne

if [[ $? -eq 1 ]] ; then
  printf " - Exit: curl not found\n"
  exit 1
fi

chsh -s /usr/bin/zsh

which starship > /dev/null
if [[ $? -eq 1 ]] ; then
  curl -fsSL https://starship.rs/install.sh | bash
fi

if [ -e "$HOME/.oh-my-zsh" ] ; then
  printf "   - Skip: oh-my-zsh already installed\n"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone https://github.com/zsh-users/zsh-autosuggestions \
            $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# ---------- LINK FILES ---------- #
rm ~/.zshrc

declare -a links=(
    ".emacs"
    ".emacs.d"
    ".zshrc"
    ".config/starship.toml"
)
cd
for x in "${links[@]}"
do
    src=$ROOT$x
    dest=$x

    echo $src
    echo $dest

    ln -s $src $dest
done

cd $HERE
