#!/bin/bash

#
# Should be run as local user
#

if [ "$(id -u)" == "0" ]; then
    echo "This script must not be run as root"
    exit 1
fi

SCRIPT_DIR=`dirname "$0"`

mkdir -p ~/.vim/colors

cp $SCRIPT_DIR/vim/.vimrc ~/
cp $SCRIPT_DIR/vim/.ycm_extra_conf.py ~/.vim/
cp $SCRIPT_DIR/vim/solarized.vim ~/.vim/colors

