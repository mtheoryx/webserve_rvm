#!/bin/env bash

git=false

# First, see if rvm or git is already installed for this user
if command -v git
then
    printf "Git already installed.\n"
    git=true
else
    printf "Installing Git for user (git command not found)\n"
    src_path=$HOME/.src
    dest_path=$HOME/opt
    
    package=git
    version=1.7.5.3
    
    mkdir -p $src_path
    mkdir -p $dest_path
    
    cd $src_path
    
    printf "Getting git source.\n"
    curl -LO http://kernel.org/pub/software/scm/git/$package-$version.tar.bz2
    tar -xjvf $package-$version.tar.bz2
    
    cd $package-$version
    
    ./configure --prefix=$dest_path
    
    printf "Making git source.\n"
    make
    
    printf "Installing git source.\n"
    make install
    
    printf "Checking install...\n"
    cd $dest_path
    
    printf "Git installation complete. Setting up your path...\n"
    touch $HOME/.bash_profile
    
    # temporarily doing this until i can figure out the path problems on webserve
    ln -s $dest_path/bin/git $HOME/bin/git
    
    if command -v git
    then
        git=true
    else
        git=false
    fi
fi
printf "=> Installing RVM the Ruby enVironment Manager\n  https://rvm.beginrescueend.com/rvm/install/\n"
# TODO: Include the rvm installer in this script
# TODO: Include initial rvm rubies in this script
# TODO: Include initial gemset creation and configuration in this script
# TODO: install base level ruby gems in this script