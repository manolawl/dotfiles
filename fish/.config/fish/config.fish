if status --is-login
    set -gx PATH $PATH ~/linux/bin
end

if status is-interactive
# Commands to run in interactive sessions can go here
end

function dots
  cd ~/dotfiles && git status
end

function ezl
  eza -l -a
end

function nvimcd
  cd ~/.config/nvim/
  tree
end

function fishcd
  cd ~/.config/fish/
  tree
end

function kittycd
  cd ~/.config/kitty/
  tree
end

function hyprcd
  cd ~/.config/hypr/
  tree
end

function wbrcd
  cd ~/.config/waybar/
  tree
end

starship init fish | source
