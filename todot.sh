#!/bin/bash
for i in ".gitconfig" ".zlogout" ".zprofile" ".zpreztorc" ".Rprofile" ".welcome"
do
	cp ~/$i ./dotfiles/
done
