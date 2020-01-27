# Dotfiles

My dotfiles, built to work with GNU stow in a `~/.dotfiles` directory.

## Installation

The main dependency is [GNU stow](https://www.gnu.org/software/stow/). Install it using your distribution's package manager.

```bash
sudo pacman -S stow
sudo apt-get install stow
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

Finally, you can run the `install` script, which will bootstrap dependencies for stowed packages only. For example, it will install `fzf` and `tmux` if you've stowed their packages.

```bash
~/.dotfiles/install
```

Requirements of the install script: `git` and other basics such as `bash`, `sudo` and `wget`.

## Environment variables used:

| Name    | Description                                                 | Default        |
| ------- | ----------------------------------------------------------- | -------------- |
| `THEME` | The Base16 theme that will be used for Base16 Shell and FZF | `default-dark` |
