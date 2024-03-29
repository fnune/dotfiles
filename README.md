# Dotfiles

![Install on Arch](https://github.com/fnune/dotfiles/workflows/Install%20on%20Arch/badge.svg)
![Install on Debian](https://github.com/fnune/dotfiles/workflows/Install%20on%20Debian/badge.svg)

My dotfiles, built to work with GNU stow in a `~/.dotfiles` directory.

## Installation

The main dependency is [GNU stow](https://www.gnu.org/software/stow/). Install it using your distribution's package manager.

```bash
sudo pacman -S stow curl wget desktop-file-utils
sudo apt-get install stow curl wget build-essential desktop-file-utils
```

Then clone this repository into a directory that's directly under `~`, for example:

```bash
git clone git@github.com:fnune/dotfiles.git ~/.dotfiles
```

Then symlink the packages you need:

```bash
cd ~/.dotfiles
stow zsh fzf git tmux
```

Finally, you can run [the install script](dependencies/.dependencies/install), which will bootstrap dependencies for stowed packages only. For example, it will install `fzf` and `tmux` if you've stowed their packages.

```bash
~/.dotfiles/install
```

Requirements of the install script: `git` and other basics such as `bash`, `sudo` and `wget`.

## Interaction between packages

Some packages source files in drop-in directories, inspired by [systemd drop-in units](https://coreos.com/os/docs/latest/using-systemd-drop-in-units.html). Here's a summary of them:

- The [zsh](zsh) package creates a `~/.zsh/includes` directory in which other packages can add files. They are sourced at the end of `~/.zshrc`.
- The [dependencies](dependencies) package creates a `~/.dependencies/includes` directory. Files in it are run from the install script and should be executable.

For example, after stowing some packages, these directories look like this:

```bash
➜  ~ ls ~/.zsh/includes
fzf  fzf-theme  volta
➜  ~ ls ~/.dependencies/includes
antigen  arch  base16-fzf  base16-shell  fzf  tpm  debian  volta
```

For example, the [fzf](fzf) package adds files to both the `zsh` and `dependencies` drop-in directories:

```
fzf
├── .dependencies
│   └── includes
│       ├── base16-fzf
│       └── fzf
└── .zsh
    └── includes
        ├── fzf
        └── fzf-theme
```

GNU stow will take care of symlinking partially without overwriting the `.dependencies` and `.zsh` directories with those from other packages.
