# Dotfiles

These are config files to set up a system the way I like it.


## Installation

```
git clone git://github.com/mcb/dotfiles ~/.dotfiles
cd ~/.dotfiles
rake install
 ```
  
## Vim Plugins
There are a few vim plugins I use. Please review `.gitmodules` File _before_ installation, if you'd like to use these.

## Environment

I am running on Mac OS X, but it will likely work on Linux as well with
minor fiddling. I use zsh on OS X, so if you would like to use these dotfiles, you should consider switching to zsh.
The `rake install` command from above will ask you to do so and switch automatically once you confirm.

If there are some shell configuration settings which you want secure or
specific to one system, place it into a `~/.localrc` file. This will be
loaded automatically if it exists.


## Sources

Thanks to Ryan Bates (@ryanb) who built the rake tasks, I started with. All others sources are noted within the files.
