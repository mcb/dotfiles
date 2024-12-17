# Dotfiles

These are config files to set up a system the way I like it.


## Installation

```
git clone git://github.com/mcb/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
 ```
  
## Vim Plugins
There are a few vim plugins I use. Please review `.gitmodules` File _before_ installation, if you'd like to use these.

## Direnv

I make extensive use of direnv for my python/java needs. Please make sure to install direnv, otherwise this setup will *not* work.

## Environment

I am running on macOS, but it will likely work on Linux as well with
minor fiddling. I use zsh on macOS, so if you would like to use these .dotfiles, you should consider switching to zsh.

If there are some shell configuration settings which you want secure or
specific to one system, place it into a `~/.localrc` file. This will be
loaded automatically if it exists.


## Sources

All sources are noted within the files.
