#!/bin/bash
#####################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfile in ~/dotfiles.
#####################

###### Variables
dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc vim"

# Create ~/dotfiles_old
echo -n "Creating $olddir for backup of any existing dotfiles in ~..."
mkdir -p $olddir
echo "done."

# Change to the dotfiles directory
echo -n "Changing to $dir directory..."
cd $dir
echo "done."

# Move existing dotfiles in ~ to dotfiles_old, then create symlinks from ~ to anyfiles in ~/dotfiles
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file ~/dotfiles_old
	echo "Creating symlink to $file in ~."
	ln -s $dir/$file ~/.$file
done
