# mugukamil's dotfiles

![Terminal.app](https://raw.github.com/sapegin/dotfiles/master/color/squirrelsong_terminal.png)


## Features

* Custom color scheme for iTerm and Terminal.app: [Squirrelsong](https://github.com/sapegin/dotfiles/tree/master/color).
* Custom zsh theme with Git status, etc: [Squirrelbook](https://github.com/sapegin/dotfiles/tree/master/zsh/themes/squirrelbook.zsh-theme).
* Dotfiles syncronization: [sync.py](https://github.com/mugukamil/dotfiles/blob/master/sync.py).
* Sensible OS X defaults: [setup/osx.sh](https://github.com/mugukamil/dotfiles/blob/master/setup/osx.sh).
* Sublime Text 3 settings syncronization: [setup/sublime-settings.sh](https://github.com/mugukamil/dotfiles/blob/master/setup/sublime-settings.sh).
* zsh install script: [setup/zsh.sh](https://github.com/mugukamil/dotfiles/tree/master/setup/zsh.sh).
* Sapegin's magic project opener ([bin/repo](https://github.com/mugukamil/dotfiles/blob/master/bin/repo)).
* [Lots of Sapegin's scripts](https://github.com/mugukamil/dotfiles/tree/master/bin).


## Installation

(Fork this repo if you want to use my dotfiles.)

Prerequisites:

1. [Install Xcode Command Line Tools](http://railsapps.github.io/xcode-command-line-tools.html).
1. [Generate SSH key](https://help.github.com/articles/generating-ssh-keys/).
1. [Install Homebrew](http://brew.sh/).

Then run these commands in the terminal:

```
brew install git
git clone git@github.com:mugukamil/dotfiles.git ~/dotfiles
cd ~/dotfiles
./sync
cd ~/dotfiles/setup
```

Now you can run scripts like `osx.sh` or `server.sh` to install other stuff.


## Updating

```bash
dotfiles
```


## Notes

You can use any file extensions in `tilde/` to invoke proper syntax highlighting in code editor.


## Further customization

* Add any zsh profile customizations to `~/.zshlocal`.
* Add your git username/email/etc. to `~/.gitlocal`.


## Resources

* [Sapegin's Dotfiles ❤ ~/](http://github.com/sapegin/dotfiles)
* [GitHub ❤ ~/](http://dotfiles.github.com/)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Jan Moesen’s dotfiles](https://github.com/janmoesen/tilde)
* [Nicolas Gallagher’s dotfiles](https://github.com/necolas/dotfiles)
* [Zach Holman’s dotfiles](https://github.com/holman/dotfiles)
* [Jacob Gillespie’s dotfiles](https://github.com/jacobwg/dotfiles)
* [Yet Another Dotfile Repo](https://github.com/skwp/dotfiles)
* [Mac OS X Lion Setup](https://github.com/ptb/Mac-OS-X-Lion-Setup)


---

:shipit:
