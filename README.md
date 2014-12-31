Dot Files
=========

These are dot files that configure my terminal environment.  They
are as important as the code that I write, so it is worth saving.

To recover:
```
DOTDIR=$(cwd)
cd ~
ln -s $DOTDIR/bash_profile .bash_profile
ln -s $DOTDIR/vimrc .vimrc
ln -s $DOTDIR/screenrc .screenrc
ln -s $DOTDIR/tmux.conf .tmux.conf
ln -s $DOTDIR/ctags .ctags
ln -s $DOTDIR/lein_profiles.clj .lein/profiles.clj
```

Resources
---------

Comments are placed where appropriate, except ctags doesn't allow them:

- ctags config source: https://gist.github.com/spicycode/5254493
