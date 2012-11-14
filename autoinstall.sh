#!/bin/sh

#set -x

VIM_DIR=~/.vim
VIMRC=~/.vimrc
INSTALL_TO=$HOME/.vim

warn() {
    echo "*** $1\n*** exit ..." >&2
}

die() {
    warn "$1"
    exit 1
}

preinstall() {
	[ -e "$VIM_DIR" ] && die "$VIM_DIR already exists."
	[ -e "$VIMRC" ] && die "$VIMRC already exists."
	git clone git://github.com/z7z8th/vimrc.git $INSTALL_TO
}

[ "$1" = "pre" -o -z "$1" ] && { preinstall; exit 0; }
[ "$1" = "post" -o -z "$1" ] || exit 0

[ "$INSTALL_TO" = "$VIM_DIR" ] || ( [ -L "$VIM_DIR" ] && ln -sf $INSTALL_TO $VIM_DIR ) ||
    warn "$VIM_DIR exits and is not a Symlink, leave it unmodified. Please link it to $INSTALL_TO yourself."

cd $INSTALL_TO

# Download vim plugin bundles
echo "init and update git submodule"
git submodule init
git submodule update

# Compile command-t for the current platform
which ruby 2>&1 1>/dev/null || die "command 'ruby' not found"
cd bundle/command-t/ruby/command-t &&
    ruby extconf.rb 2>&1 1>/dev/null && make clean && make 2>&1 1>/dev/null && 
        echo "Ruby compilation succeed." || warn "Ruby compilation failed. Ruby not installed, maybe?"

# Symlink ~/.vim and ~/.vimrc
[ ! -e "$VIMRC" -o -L "$VIMRC" ] && ln -sf "$VIM_DIR/vimrc" $VIMRC ||
    warn "$VIMRC exists and is not a Symlink, leave it unmodified. Please link it to $VIM_DIR/vimrc yourself."
[ ! -e "$VIM_DIR/user.vim" ] && touch $VIM_DIR/user.vim

echo "==== vimrc installed and configured, have fun. ===="
