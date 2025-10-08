dotfiles_dir=~/.dotfiles
template_dir=~/.dotfiles/templates
package_path=''
package_command=''

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
  ln -sf $dotfiles_dir/zsh ~/.zsh
  ln -sf $dotfiles_dir/zshrc ~/.zshrc
  ln -sf $dotfiles_dir/config ~/.config
}

#=============
# Create personalized gitconfig
#=============

Vcs() {
  echo "Personalizing your jj/git(hub) experience"
  read -p "Your Full Name: " name
  read -p "Your Github ID: " id
  read -p "Your Github Username: " username

  export name id username
  # cat $template_dir/gitconfig | envsubst > ~/.gitconfig
  cat $template_dir/jjconfig | envsubst > ~/.config/jj/config.toml
}

Packages() {
  echo "Installing listed packages based on profile. Do you want to use this computer for work or private? Please type in the number of the option."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    package_path='macports'
    package_command='sudo port install'
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    package_path='apt'
    package_command='sudo apt install -y'
  else
    echo "Unkown OS."
    exit 1
  fi
  select wp in "Work" "Private"; do
    case $wp in
      Work ) for p in $(cat $dotfiles_dir/$package_path/Packages.work); do $package_command $p; done; break;;
      Private ) for p in $(cat $dotfiles_dir/$package_path/Packages.private); do $package_command $p; done; break;;
    esac
  done
}

Help()
{
  echo "Usage:"
  echo
  echo "-a   Perform all setup steps"
  echo "-g   Set up personalised jj/gitconfig"
  echo "-h   Print this help"
  echo "-p   Set up packages from list"
  echo "-r   Remove all existing resources"
  echo "-l   Set up symlinks"
  echo
}



while getopts ":hagpbrl" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      a) # perform all actions except for Brew
         Cleanup
         Symlink
         Packages
         Vcs
         exit;;
      g) # Set up git/jj
         Vcs
         exit;;
      p) # Set up Packages
         Packages
         exit;;
      b) # Set up Brew
         Brew
         exit;;
      r) # Remove all existing resources
         Cleanup
         exit;;
      l) # Symlink creation
         Symlink
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         Help
         exit;;
   esac
done

Help
