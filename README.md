# Emil's Dotfiles
These are my personal dotfiles just to have them backed up and source controlled.

In order to set them up run the following from your home directory after cloning this directory to your preferred path

```
ln -s /path/to/repo/.bashrc .bashrc
ln -s /path/to/repo/.gitconfig .gitconfig
ln -s /path/to/repo/.gitignore_global .gitignore_global
ln -s /path/to/repo/.shell_preferences.sh .shell_preferences.sh
ln -s /path/to/repo/.vim .vim
ln -s /path/to/repo/.vimrc .vimrc
ln -s /path/to/repo/ssh_config .ssh/config
ln -s /path/to/repo/nvim ~/.config/nvim
ln -s /path/to/repo/vscode/keybindings.json ~/.config/Code/keybindings.json
ln -s /path/to/repo/vscode/settings.json ~/.config/Code/settings.json
```

In order for Neovim to pick up on the new plugins you may have to run `:UpdateRemotePlugins`.

For install of the `editorconfig` vim plugin you may also need to run `sudo apt install editorconfig`
