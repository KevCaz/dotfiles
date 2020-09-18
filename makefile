clone:
	sh todot.sh /
	cp /etc/apt/sources.list config/
	cp ~/.atom/*.cson config/
	cp ~/.atom/*.coffee config/
	cp -r ~/.kevcaz/scripts config/kevcaz
	cp -r ~/.config/VSCodium/User/snippets config/vscodium/
	cp ~/.config/VSCodium/User/*.json config/vscodium/
	dconf dump /org/gnome/terminal/legacy/profiles:/ > config/gnome-terminal-profiles.dconf.bak
	dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > config/media-keys-keybindings.dconf.bak


deploy:
	cp dotfiles/.z* ~/
	cp dotfiles/.uncru* ~/
	cp dotfiles/.welcome ~/
	cp dotfiles/.gitconfig ~/
	cp dotfiles/.Rprofile ~/
	cp config/*.cson ~/.atom/
	cp config/*.coffee ~/.atom/
	cp -r config/vscodium/snippets ~/.config/VSCodium/User/ 
	cp config/vscodium/*.json ~/.config/VSCodium/User/
	cp -r config/.kevcaz/ ~
	dconf load /org/gnome/terminal/legacy/profiles:/ < config/gnome-terminal-profiles.dconf.bak
	dconf load /org/gnome/settings-daemon/plugins/media-keys/ < config/media-keys-keybindings.dconf.bak