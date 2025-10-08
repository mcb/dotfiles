dotfiles_dir=~/.dotfiles
template_dir=~/.dotfiles/templates

#=============
# Clean all existing resources
#=============

Cleanup()
{
  echo "Removing all existing config files"

  rm -rf ~/.vim > /dev/null 2>&1
  rm -rf ~/.vimrc > /dev/null 2>&1
  rm -rf ~/.zsh > /dev/null 2>&1
  rm -rf ~/.zshrc > /dev/null 2>&1
  # rm -rf ~/.gitconfig > /dev/null 2>&1
  rm -rf ~/.config > /dev/null 2>&1
}

#=============
# Create symlinks in the home folder
#=============
Symlink() 
{
  echo "Creating all symlinks"
  ln -sf $dotfiles_dir/vim ~/.vim
  ln -sf $dotfiles_dir/vimrc ~/.vimrc
  ln -sf $dotfiles_dir/zsh ~/.zsh
  ln -sf $dotfiles_dir/zshrc ~/.zshrc
  ln -sf $dotfiles_dir/config ~/.config
}

#=============
# Create personalized gitconfig
#=============

Git() {
  echo "Personalizing your jj/git(hub) experience"
  read -p "Your Full Name: " name
  read -p "Your Github ID: " id
  read -p "Your Github Username: " username

  export name id username
  # cat $template_dir/gitconfig | envsubst > ~/.gitconfig
  cat $template_dir/jjconfig | envsubst > ~/.config/jj/config.toml
}

Macports() {
  echo "Installing listed ports based on profile. Do you want to use this computer for work or private? Please type in the number of the option."
  select wp in "Work" "Private"; do
    case $wp in
      Work ) for p in $(cat $dotfiles_dir/macports/Portfile.work); do sudo port install $p; done; break;;
      Private ) for p in $(cat $dotfiles_dir/macports/Portfile.private); do sudo port install $p; done; break;;
    esac
  done
}

Help()
{
  echo "Usage:"
  echo
  echo "-a   Perform all setup steps"
  echo "-g   Set up personalised gitconfig"
  echo "-h   Print this help"
  echo "-m   Set up macports from list"
  echo "-r   Remove all existing resources"
  echo "-l   Set up symlinks"
  echo
}


while getopts ":hagmrl:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      a) # perform all actions
         Cleanup
         Symlink
         Macports
         Git
         exit;;
      g) # Set up git
         Git
         exit;;
      m) # Set up Macports
         Macports
         exit;;
      r) # Remove all existing resources
         Cleanup
         exit;;
      l) # Symlink creation
         Symlink
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

Help
