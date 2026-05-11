if status --is-login
    set -gx PATH $PATH ~/linux/bin
end

if status is-interactive
# Commands to run in interactive sessions can go here
end

source ~/.config/scripts/environment_variables.sh
source ~/.config/fish/functions

starship init fish | source
