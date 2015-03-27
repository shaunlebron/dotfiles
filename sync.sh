#!/bin/bash

set -e

DOTDIR=$(pwd)
cd ~
ln -s $DOTDIR/bash_profile .bash_profile
ln -s $DOTDIR/vimrc .vimrc
ln -s $DOTDIR/screenrc .screenrc
ln -s $DOTDIR/tmux.conf .tmux.conf
ln -s $DOTDIR/ctags .ctags
ln -s $DOTDIR/lein_profiles.clj .lein/profiles.clj
