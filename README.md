#dotfiles

##About

These are the dotfiles I use on both OSX and linux machines. These configurations mostly apply to
vim, tmux, and zsh, but I also have some bash configurations for the rare cases where I can't use zsh.
A lot of the credit for these configuration is owed to [Square's](http://square.github.io/) *[Maximum Awesome](https://github.com/square/maximum-awesome)*
and [Thoughtbot's](http://thoughtbot.com/) *[dotfiles](https://github.com/thoughtbot/dotfiles)*.

##Install

It is highly recommended that you run [Laptop](https://github.com/jonr22/laptop) to setup and install these dotfiles on your machine. After running this script, you will still need to follow a few steps to take full advantage of these configurations:
* install the fonts (details coming soon)
* install the solarized colors in your terminal (details coming soon)
* run `:PluginInstall` within vim to install the vim plugins.

##Update

```
cd ~/.dotfiles
git pull
rcup -v
```
This assumes you used [Laptop](https://github.com/jonr22/laptop) to install the dotfiles, if not, please modify these steps accordingly.


##Included Files

Alias| File | Description
-----|------|------------
`.aliases` | `aliases` | Shared aliases between bash and zsh, this sources `.aliases.local`.
`.bash_aliases` | `bash_aliases` | Some bash specific aliases (with zsh most of these are handled via oh-my-zsh), such as `la` and `ll` as well as other common aliases.
`.bash_profile` | `bash_profile` | The bash profile, this just calls bashrc so that everything is funneled through one configuration.
`.bashrc` | `bashrc` | The main bash configuration file. This sources `bash_aliases`, `aliases`, and `env`, and sets some standard configuration settings.
`.env` | `env` | Sets environment variables such as the PATH as well as RVM and NVM settings. It checks for certain files and folders and then adds them to the path if they exist. This is called by both zsh and bash. This also sources `.env.local`.
`.gitconfig` | `gitconfig` | The git configuration file, it contains aliases (described below) and some other common settings. This sources `.gitconfig.local`.
`.gitignore` | `gitignore` | Files that git should ignore globally.
`.oh-my-zsh` | `oh-my-zsh` | The [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) package. This contains many aliases and other helpful settings.
`.rcrc` | `rcrc` | The [rcm](https://github.com/thoughtbot/rcm) configuration.
`.tmux.conf` | `tmux.conf` | Configuration settings for tmux. Some of these settings are described below. They are all platform independent. For OS X / linux specific settings (mainly for copy/paste) see the `tmux.conf.mac.local` and `tmux.conf.linux.local` files described below. This sources `.tmux.conf.local`
`.vim` | `vim` | The vim directory, this contains all vim plugins/bundles as submodules.
`.vimrc` | `vimrc` | The vim configuration settings. Some of these settings are described below. This sources `.vimrc.local`.
`.vimrc.bundles` | `vimrc.bundles` | Vim plugins, managed by vundle. This sources `.vimrc.bundles.local`.
`.zshrc` | `zshrc` | The main zsh configuration file. This sources `aliases`, `env`, and `oh-my-zsh`.

##Customizations

All local customizations should be made in these files:

* `.aliases.local` - aliases to be used by both zsh and bash
* `.env.local` - environment settings (like PATH modification) to be used by both zsh and bash
* `.gitconfig.local` - local git settings such as user and email
* `.laptop.local` - [local installation setup](https://github.com/jonr22/laptop#make-your-own-customizations)
* `.tmux.conf.local` - local tmux settings, OS X and linux specific copy/paste settings can be used by copying either `tmux.conf.mac.local` or `tmux.conf.linux.local`
* `.vimrc.bundles.local` - vim plugin customizations
* * `.vimrc.local` - vim customizations

##External Dependencies

Managed via [Laptop](https://github.com/jonr22/laptop).

##Recomendations

* [Solarized](http://ethanschoonover.com/solarized) color scheme. Colors for [iTerm2](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized)
and [gnome terminal](https://github.com/sigurdga/gnome-terminal-colors-solarized) are available.
* [Powerline fonts](https://github.com/Lokaltog/powerline-fonts) (used with Airline in vim) and set it as the default for your terminal.
I prefer [Meslo LG S Regular for Powerline](https://github.com/Lokaltog/powerline-fonts/blob/master/Meslo/Meslo%20LG%20S%20Regular%20for%20Powerline.otf).


##Settings

### vim

* `,d` brings up [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
* `,t` brings up [ctrlp.vim](https://github.com/kien/ctrlp.vim), a project file filter for easily opening specific files
* `,b` restricts ctrlp.vim to open buffers
* `,g` show git changes in the gutter
* `,]` rebuild tags
* `,c` close buffer properly
* `:w!!` save read only file via sudo
* `,a` starts project search with [ack.vim](https://github.com/mileszs/ack.vim) using [the silver searcher](https://github.com/ggreer/the_silver_searcher) (like ack, but faster)
* `,V` reload vimrc
* `,y` yank to system clipboard
* `,p` paste from system clipboard
* `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
* `gcc` toggles current line comment
* `gc` toggles visual selection comment lines
* `,[space]` strips trailing whitespace (this is also done automatically on save/write)
* `<C-]>` jump to definition using ctags
* `,l` begins aligning lines on a string, usually used as `,l=` or `,l:` to align assignments
* `<C-hjkl>` move between windows, shorthand for `<C-w> hjkl` (also navigates to tmux via [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator))

### tmux

* `<C-a>` is the prefix
* `prefix v` makes a vertical split
* `prefix s` makes a horizontal split
* `prefix <C-v>` makes a 25% vertical split
* `prefix <C-s>` makes a 25% horizontal split
* `<C-hjkl>` move between panes with no prefix needed (also navigates to vim via [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator))

### git

* `git lg` colorful graph log
* `git st` simplified status
* `git co` checkout
* `git ci` commit
* `git d` diff
* `git dc` diff --cached
* `git b` branch
* `git ba` branch -a
* `git logb` log --first-parent (this only looks at changes made on the specific branch, ignoring changes made to merged in branches)
* `git lgb` logb in color in short form

