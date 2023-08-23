dotfiles_dir=~/.dotfiles

#=============
# Clean all existing resources
#=============

echo "Removing all existing config files"

rm -rf ~/.vim > /dev/null 2>&1
rm -rf ~/.vimrc > /dev/null 2>&1
rm -rf ~/.zsh > /dev/null 2>&1
rm -rf ~/.zshrc > /dev/null 2>&1
rm -rf ~/.gitconfig > /dev/null 2>&1
rm -rf ~/Brewfile > /dev/null 2>&1
rm -rf ~/.config > /dev/null 2>&1

#=============
# Create symlinks in the home folder
#=============

echo "Creating all symlinks"
ln -sf $dotfiles_dir/vim ~/.vim
ln -sf $dotfiles_dir/vimrc ~/.vimrc
ln -sf $dotfiles_dir/zsh ~/.zsh
ln -sf $dotfiles_dir/zshrc ~/.zshrc
ln -sf $dotfiles_dir/Brewfile ~/Brewfile
ln -sf $dotfiles_dir/config ~/.config

#=============
# Create personalized gitconfig
#=============

echo "Personalizing your git(hub) experience"
read -p "Your Full Name: " name
read -p "Your Github ID: " id
read -p "Your Github Username: " username

export name id username
cat $dotfiles_dir/gitconfig.txt | envsubst > ~/.gitconfig
