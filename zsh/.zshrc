# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mano/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

eval "$(starship init zsh)"
alias ls="ls -a  --color=auto"
alias grep="rg -p -i"
alias tree="tree -a -C"
alias ff="fastfetch"
