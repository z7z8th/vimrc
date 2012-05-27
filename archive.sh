#!/bin/sh

cd $(dirname $0)
cd ..

tar -cjvLf vimrc.tar.bz2 \
    --exclude='vimrc/view' \
    --exclude='.git' \
    --exclude='*.DS_Store' \
    --exclude='vimrc/.tmp' \
    --exclude='vimrc/.undo' \
    --exclude='NERDTreeBookmarks' \
    vimrc
