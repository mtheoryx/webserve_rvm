#!/bin/env bash

git=false
ruby_version="1.9.2"

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
# TODO: include the rvm installer script from my github account for webserve

# curl -s -O -L -B https://github.com/mtheoryx/webserve_rvm/raw/master/rvm-install-head
# chmod +x rvm-install-head
# 
# "$PWD/rvm-install-head"
# 
# if [[ -f rvm-install-head ]]
#   then
#     rm -f rvm-install-head
# fi
# 
# printf "=> Setting up RVM to load with new shells.\n"
# echo  '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*' >> "$HOME/.bash_profile"
# 
# printf "=> Loading RVM"
# 
# source ~/.rvm/scripts/rvm

# TODO: Include initial rvm rubies in this script
# printf "=> Installing Ruby 1.8.7\n  More information about installing rubies can be found at https://rvm.beginrescueend.com/rubies/installing/"
# 
# rvm install $ruby_version
# 
# printf "=> Using 1.9.2 and setting it as default for new shells\n  More information about Rubies can be found at https://rvm.beginrescueend.com/rubies/default/\n"
# 
# rvm use $ruby_version --default

# TODO: Include initial gemset creation and configuration in this script
# printf "=> Installing Bundler to the global gemset.\n  https://rvm.beginrescueend.com/gemsets/global/\n"
# 
# rvm gemset use global
# 
# gem install bundler --no-rdoc --no-ri
# 
# rvm gemset clear

# TODO: install base level ruby gems in this script
