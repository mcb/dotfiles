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
Java is supported by using Jabba, please install this using brew. direnv plugs into to this to always set up the correct java for my projects.

To make use of python in your projects, place a `.envrc` file with the contents `layout python python3.12` into the root of the directory and `direnv allow` after closing the file. Same goes for Java, place `use java adopt@1.11.0-6` or anything like this into the `.envrc` file to use the required version.



## Environment

I am running on macOS, but it will likely work on Linux as well with
minor fiddling. I use zsh on macOS, so if you would like to use these .dotfiles, you should consider switching to zsh.

If there are some shell configuration settings which you want secure or
specific to one system, place it into a `~/.localrc` file. This will be
loaded automatically if it exists.


## Sources

All sources are noted within the files.
