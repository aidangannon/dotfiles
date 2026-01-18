.PHONY: install
install: uninstall
	ln -sf $(PWD)/bash/.bashrc $(HOME)/.bashrc
	ln -sf $(PWD)/git/.gitconfig $(HOME)/.gitconfig
	ln -sf $(PWD)/tmux/.tmux.conf $(HOME)/.tmux.conf
	ln -sf $(PWD)/nvim $(HOME)/.config/nvim
	ln -sf $(PWD)/vim/.vimrc $(HOME)/.vimrc
	ln -sf $(PWD)/vim/.vim $(HOME)/.vim
	ln -sf $(PWD)/sway/config $(HOME)/.config/sway/config
	ln -sf $(PWD)/waybar/config $(HOME)/.config/waybar/config
	ln -sf $(PWD)/waybar/style.css $(HOME)/.config/waybar/style.css
	ln -sf $(PWD)/alacritty/alacritty.toml $(HOME)/.config/alacritty/alacritty.toml
	ln -sf $(PWD)/swaylock/config $(HOME)/.config/swaylock/config

.PHONY: uninstall
uninstall:
	rm -rf $(HOME)/.bashrc
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
