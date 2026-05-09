if status --is-login
    set -gx PATH $PATH ~/linux/bin
end

if status is-interactive
# Commands to run in interactive sessions can go here
end

source $XDG_DOCUMENTS_DIR/scripts/environment_variables.sh
source $XDG_CONFIG_HOME/fish/functions

starship init fish | source
