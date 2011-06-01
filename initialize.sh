#!/bin/env bash

# First, see if rvm or git is already installed for this user
if command -v git
then
    printf "Git already installed.\n"
else
    printf "Installing Git for user (git command not found)"
    src_path=$HOME/.src
    dest_path=$HOME/opt
    
    package=git
    version=1.7.5.3
    
    mkdir -p $src_path
    mkdir -p $dest_path
    
    cd $src_path
    
    curl -LO http://kernel.org/pub/software/scm/git/$package-$version.tar.bz2
    tar -xjvf $package-$version.tar.bz2
    
fi