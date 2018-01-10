cur = $(shell pwd)

clone:
	cp ~/.zprofile $(cur)/dotfiles/
	cp ~/.Rprofile $(cur)/dotfiles/
	cp ~/.welcome $(cur)/dotfiles/
	cp ~/.zlogout $(cur)/dotfiles/
	cp ~/.atom/*.cson $(cur)/dotfiles/
	cp ~/.atom/*.cson $(cur)/dotfiles/
	cp ~/Github/Rpackages/pkg2date.R $(cur)/config/
	# cd .todolist $(cur)/dotfiles/

deploy:
	cp $(cur)/dotfiles/.zprofile ~/
	cp $(cur)/dotfiles/.Rprofile ~/
	cp $(cur)/dotfiles/.welcome ~/
