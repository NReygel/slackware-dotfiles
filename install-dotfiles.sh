#!/bin/bash
# install-dotfiles.sh
# Usage: ./install-dotfiles.sh
# Creates symlinks for bash and vim dotfiles

set -e  # exit on error

REPO="$HOME/slackware-dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "Backing up existing dotfiles to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Function to backup and symlink a file
link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Backing up $dest"
        mv "$dest" "$BACKUP_DIR/"
    fi

    echo "Linking $dest → $src"
    ln -s "$src" "$dest"
}

# Bash dotfiles
link_file "$REPO/bash/bashrc" "$HOME/.bashrc"
link_file "$REPO/bash/bash_aliases" "$HOME/.bash_aliases"
link_file "$REPO/bash/bash_functions" "$HOME/.bash_functions"

# Vim dotfile
link_file "$REPO/vim/vimrc" "$HOME/.vimrc"

echo "Done! All dotfiles are now symlinked."
