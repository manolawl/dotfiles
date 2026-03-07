if status --is-login
    set -gx PATH $PATH ~/linux/bin
end

if status is-interactive
# Commands to run in interactive sessions can go here
end

function dots
  cd ~/dotfiles && git status
end

function ll
  ls -A -C -lh --color=auto
end

function grep
  rg -p -i
end

function tr
  tree -a -C
end

function ff
  fastfetch
end

function firefox
  zen-browser
end

starship init fish | source
