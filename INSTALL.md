#Detailed Install Guide

##Setup dotfiles
```
git clone https://github.com/jonr22/dotfiles.git
cd dotfiles
git submodule init
git submodule update
```

##Install and setup external dependencies
###OS X
TODO: add notes for OSX

###linux
####rvm
```
\curl -sSL https://get.rvm.io | bash -s stable
```
reopen terminal
```
rvm install 2.0
```
(use `rvm list known` to get latest version info)

####nvm
```
curl https://raw.githubusercontent.com/creationix/nvm/v0.7.0/install.sh | sh
```
reopen terminal
```
nvm ls-remote
nvm install v0.11.13 (use latest)
nvm alias default 0.11.13 (use installed version)
```

####pip / autoenv
TODO: add notes on installing pip and autoenv

####zsh
```
chsh -s $(which zsh)
```
(restart/log out required)

If zsh doesn't exist on your machine: `sudo apt-get install zsh`

####tmux
```
sudo apt-get install tmux
```

if the tmux version (`tmux -V`) is less than 1.8, then you'll have to install from source:
```
sudo apt-get install libevent-dev libncurses-dev pkg-config
tar -xzf tmux-<version>.tar.gz (version >= 1.8)
cd tmux-<version>
./configure && make
sudo make install
```
(restart terminal)

####other
```
sudo apt-get install vim-gnome
sudo apt-get install exuberant-ctags [brew install ctags-exuberant]
sudo apt-get install silversearcher-ag
sudo pip install jedi
sudo pip install pyflakes
npm install -g jshint
```

####gnome terminal setup
#####profiles
Create a 'solarized-dark' and a 'solarized-light' profile, set one of these as default (Edit > Profiles)

#####colors
```
cd ~/dotfiles/linux/gnome-terminal-solarized
```
if gnome is > 3.6 `sudo apt-get install dconf-cli`

`./install.sh` -> select 'dark' then select 'solarized-dark'
`./install.sh` -> select 'light' then select 'solarized-light'

#####fonts
```
fc-cache -vf ~/.fonts
```
restart terminal

set font in terminal preferences for solarized-<color> to:
    Meslo LG S for Powerline, size 10

##Create links
```
ln -s dotfiles/zsh/zshrc .zshrc
ln -s dotfiles/zsh/oh-my-zsh .oh-my-zsh
ln -s dotfiles/vim .vim
ln -s dotfiles/vim/vimrc .vimrc
ln -s dotfiles/aliases .aliases
ln -s dotfiles/env .env
ln -s dotfiles/tmux/tmux.conf .tmux.conf
ln -s dotfiles/tmux/tmux.conf.linux .tmux.conf.local
ln -s dotfiles/bash/bashrc .bashrc
ln -s dotfiles/bash/bash_aliases .bash_aliases
ln -s dotfiles/bash/bash_profile .bash_profile
ln -s dotfiles/git/gitconfig .gitconfig
ln -s dotfiles/git/gitignore .gitignore
```

###linux only
```
ln -s dotfiles/fonts .fonts
```

##Configure local settings
Local settings can safely be managed in these files:
* `~/.aliases.local`
* `~/.env.local`
* `~/.gitconfig.local`
* `~/.tmux.conf.local`
* `~/.vimrc.local`

