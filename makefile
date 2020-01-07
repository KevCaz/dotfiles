clone:
	sh todot.sh /
	cp /etc/apt/sources.list config/
	# cp -r /etc/apt/sources.list.d/ /config/
	cp ~/.atom/*.cson config/
	cp ~/.atom/*.coffee config/
	cp ~/.julia/config/* config/julia/
	cp ~/.kevcaz/to* config/kevcaz/
	cp -r ~/.config/VSCodium/User/snippets config/vscodium/
	cp ~/.config/VSCodium/User/*.json config/vscodium/

deploy:
	cp dotfiles/.z* ~/
	cp dotfiles/.welcome ~/
	cp dotfiles/.gitconfig ~/
	cp dotfiles/.Rprofile ~/
	cp config/*.cson ~/.atom/
	cp config/*.coffee ~/.atom/
	cp config/julia/config/* ~.julia/config/

