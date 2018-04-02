cur = $(shell pwd)

clone:
	cp ~/.zprofile $(cur)/dotfiles/
	cp ~/.zprofile $(cur)/dotfiles/
	cp ~/.zpreztorc $(cur)/dotfiles/
	cp ~/.zlog* $(cur)/dotfiles/
	cp ~/.Rprofile $(cur)/dotfiles/
	cp ~/.welcome $(cur)/dotfiles/
	cp ~/.atom/*.cson $(cur)/dotfiles/
	cp ~/.atom/*.coffee $(cur)/dotfiles/
	cp ~/Github/Rpackages/pkg2date.R $(cur)/config/
	# cd .todolist $(cur)/dotfiles/

deploy:
	cp $(cur)/dotfiles/.zprofile ~/
	cp $(cur)/dotfiles/.Rprofile ~/
	cp $(cur)/dotfiles/.welcome ~/
