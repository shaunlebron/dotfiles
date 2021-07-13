#!/bin/bash

set -e

DOTDIR=$(pwd)
cd ~
ln -s $DOTDIR/bash_profile .bash_profile
ln -s $DOTDIR/vimrc .vimrc
ln -s $DOTDIR/ctags .ctags
