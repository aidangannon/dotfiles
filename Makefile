.PHONY: install
install: uninstall
	ln -sf $(CURDIR)/bash/.bashrc $(HOME)/.bashrc
	ln -sf $(CURDIR)/zsh/.zshrc $(HOME)/.zshrc
	ln -sf $(CURDIR)/git/.gitconfig $(HOME)/.gitconfig
	ln -sf $(CURDIR)/tmux/.tmux.conf $(HOME)/.tmux.conf
	ln -sf $(CURDIR)/nvim $(HOME)/.config/nvim
	ln -sf $(CURDIR)/vim/.vimrc $(HOME)/.vimrc
	ln -sf $(CURDIR)/vim/.vim $(HOME)/.vim
	ln -sf $(CURDIR)/sway/config $(HOME)/.config/sway/config
	ln -sf $(CURDIR)/waybar/config $(HOME)/.config/waybar/config
	ln -sf $(CURDIR)/waybar/style.css $(HOME)/.config/waybar/style.css
	ln -sf $(CURDIR)/alacritty/alacritty.toml $(HOME)/.config/alacritty/alacritty.toml
	ln -sf $(CURDIR)/swaylock/config $(HOME)/.config/swaylock/config
	ln -sf $(CURDIR)/fuzzel/fuzzel.ini $(HOME)/.config/fuzzel/fuzzel.ini
	ln -sf $(CURDIR)/sway-easyfocus/config.yaml $(HOME)/.config/sway-easyfocus/config.yaml
	ln -sf $(CURDIR)/gtklock/config.ini $(HOME)/.config/gtklock/config.ini
	ln -sf $(CURDIR)/gtklock/style.css $(HOME)/.config/gtklock/style.css
	ln -sf $(CURDIR)/wofi/config $(HOME)/.config/wofi/config
	ln -sf $(CURDIR)/wofi/style.css $(HOME)/.config/wofi/style.css
	ln -sf $(CURDIR)/karabiner/karabiner.json $(HOME)/.config/karabiner/karabiner.json

.PHONY: uninstall
uninstall:
	rm -rf $(HOME)/.bashrc
	rm -rf $(HOME)/.zshrc
	rm -rf $(HOME)/.gitconfig
	rm -rf $(HOME)/.tmux.conf
	rm -rf $(HOME)/.config/nvim
	rm -rf $(HOME)/.vimrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/sway/config
	rm -rf $(HOME)/.config/waybar/config
	rm -rf $(HOME)/.config/alacritty/alacritty.toml
	rm -rf $(HOME)/.config/waybar/style.css
	rm -rf $(HOME)/.config/swaylock/config
	rm -rf $(HOME)/.config/fuzzel/fuzzel.ini
	rm -rf $(HOME)/.config/sway-easyfocus/config.yaml
	rm -rf $(HOME)/.config/gtklock/config.ini
	rm -rf $(HOME)/.config/gtklock/style.css
	rm -rf $(HOME)/.config/wofi/config
	rm -rf $(HOME)/.config/wofi/style.css
	rm -rf $(HOME)/.config/karabiner/karabiner.json

.PHONY: install-root
install-root: uninstall-root
	sudo ln -sf $(CURDIR)/keyd/default.conf /etc/keyd/default.conf

.PHONY: uninstall-root
uninstall-root:
	sudo rm -rf /etc/keyd/default.conf
