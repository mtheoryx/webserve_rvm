#!/bin/env bash

# First, see if rvm or git is already installed for this user
if command -v git
then
    printf "Git already installed.\n"
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
    
    if command -v git
    then
        printf "Git installation complete. Setting up your path...\n"
        ln -s $dest_path/bin/git $HOME/bin/git
        
        printf "Git configured. Cleaning up your files now.\n"
        rm -rf $src_path
    else
        printf "Something went wrong during install. Removing files."
        rm -rf $src_path $dest_path
        printf "System restored to clean slate."
    fi
fi