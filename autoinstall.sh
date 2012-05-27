#!/bin/sh


INSTALL_TO=~/

warn() {
    echo -e "*** $1" >&2
}

die() {
    warn "$1"
    exit 1
}

preinstall() {
	[ -e "$INSTALL_TO/vimrc" ] && die "$INSTALL_TO/vimrc already exists."
	[ -e "~/.vim" ] && die "~/.vim already exists."
	[ -e "~/.vimrc" ] && die "~/.vimrc already exists."
	cd "$INSTALL_TO"
	git clone git://github.com/z7z8th/vimrc.git
}

set -x

[ "$1" != "postinstall" ] && preinstall

cd $INSTALL_TO/vimrc

# Download vim plugin bundles
git submodule init
git submodule update

# Compile command-t for the current platform
which ruby || die "command 'ruby' not found"
cd ruby/command-t
(ruby extconf.rb && make clean && make) || warn "Ruby compilation failed. Ruby not installed, maybe?"

# Symlink ~/.vim and ~/.vimrc
cd ~
ln -s "$INSTALL_TO/vimrc" .vim
ln -s "$INSTALL_TO/.vim/vimrc" .vimrc
touch ~/.vim/user.vim

echo "Installed and configured .vim, have fun."
