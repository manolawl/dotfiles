export EDITOR=nvim

# XDG BASE DIRECTORIES
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# XDG USER DIRECTORIES
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_PROJECTS_DIR="$HOME/projects"
export XDG_PUBLICSHARE_DIR="$HOME/public"
export XDG_TEMPLATES_DIR="$HOME/templates"
export XDG_VIDEOS_DIR="$HOME/videos"
export XDG_DESKTOP_DIR="$HOME/desktop"

export BACKGROUNDS_DIR="$XDG_PICTURES_DIR/backgrounds"
export SCREENSHOTS_DIR="$XDG_PICTURES_DIR/screenshots"
export SCRIPTS_DIR="$XDG_DOCUMENTS_DIR/scripts"

export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export XCURSOR_PATH="/usr/share/icons:$XDG_DATA_HOME/icons"

export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
