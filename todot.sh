#!/bin/bash
for i in ".gitconfig" ".zlogout" ".zprofile" ".zpreztorc" ".Rprofile" ".welcome" ".zshrc" ".uncrustify.cfg"
do
	cp ~/$i ./dotfiles/
done
