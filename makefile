clone:
	sh todot.sh /
	cp /etc/apt/sources.list config/
	# cp -r /etc/apt/sources.list.d/ /config/
	cp ~/.atom/*.cson config/
	cp ~/.atom/*.coffee config/
	cp ~/.julia/config/* config/julia/
	cp ~/.kevcaz/to* config/kevcaz/
	cp ~/Documents/Admin/Signatures/signature.html other/

deploy:
	cp dotfiles/.z* ~/
	cp dotfiles/.welcome ~/
	cp dotfiles/.gitconfig ~/
	cp dotfiles/.Rprofile ~/
	cp config/*.cson ~/.atom/
	cp config/*.coffee ~/.atom/
	cp config/julia/config/* ~.julia/config/
