export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git \
	 sudo \
	 zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


# Alias
alias .3="../../../"
alias .2="../../"
alias sl="ls"
alias lq="ls"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias db="dune build"
alias dc="dune clean"
alias dr="dune runtest"

# Functions from alias
mkcd () {
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# Env
. "$HOME/.profile"

# Run the starship prompt
eval "$(starship init zsh)"

# opam configuration
test -r /home/valentin/.opam/opam-init/init.zsh && . /home/valentin/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH="$HOME/.poetry/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
