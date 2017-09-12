cur = $(shell pwd)

clone:
	cp ~/.zprofile $(cur)/dotfiles/
	cp ~/.Rprofile $(cur)/dotfiles/
	# cd .todolist $(cur)/dotfiles/
