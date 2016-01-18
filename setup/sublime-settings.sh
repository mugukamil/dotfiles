#!/bin/bash

# Enables Sublime settings syncronization

DIR=~/Library/Application\ Support/Sublime\ Text\ 3

[ ! -d "$DIR" ] && mkdir -p "$DIR/Packages"
if [ -d "$DIR/Packages/User" ]; then
	mkdir "$DIR/Packages.bak"
	mv "$DIR/Packages/User" "$DIR/Packages.bak/User"
fi
ln -s ~/dotfiles/sublime/User "$DIR/Packages/User"
