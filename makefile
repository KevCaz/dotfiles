cur = $(shell pwd)

clone:
	cp ~/.zprofile $(cur)/dotfiles/
	cp ~/.zprofile $(cur)/dotfiles/
	cp ~/.zpreztorc $(cur)/dotfiles/
	cp ~/.zlog* $(cur)/dotfiles/
	cp ~/.Rprofile $(cur)/dotfiles/
	cp ~/.welcome $(cur)/dotfiles/
	cp /etc/apt/sources.list $(cur)/config/
	cp ~/.atom/*.cson $(cur)/config/
	cp ~/.atom/*.coffee $(cur)/config/
	cp ~/Github/Rpackages/pkg2date.R $(cur)/config/
	# cd .todolist $(cur)/dotfiles/

deploy:
	cp $(cur)/dotfiles/.zprofile ~/
	cp $(cur)/dotfiles/.Rprofile ~/
	cp $(cur)/dotfiles/.welcome ~/
