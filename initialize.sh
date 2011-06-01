#!/bin/env bash

abort=false

# First, see if rvm or git is already installed for this user
if command -v git
then
    printf "Git already installed.\n"
else
    printf "Installing Git for user (git command not found)"
fi