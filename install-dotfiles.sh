#!/bin/bash
# install-dotfiles.sh
# Usage: ./install-dotfiles.sh
# Creates symlinks for bash and vim dotfiles

set -e  # exit on error

REPO="$HOME/slackware-dotfiles"

# Function to create a symlink if it doesn't exist
link_file() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        echo "Symlink exists: $dest → $(readlink "$dest")"
    elif [ -e "$dest" ]; then
        echo "Warning: $dest exists and is not a symlink, skipping"
    else
        echo "Creating symlink: $dest → $src"
        ln -s "$src" "$dest"
    fi
}

# Bash dotfiles
link_file "$REPO/bash/bashrc" "$HOME/.bashrc"
link_file "$REPO/bash/bash_aliases" "$HOME/.bash_aliases"
link_file "$REPO/bash/bash_functions" "$HOME/.bash_functions"

# Vim dotfile
link_file "$REPO/vim/vimrc" "$HOME/.vimrc"

echo "Done! Dotfile symlinks are ensured."
