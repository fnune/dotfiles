# Fausto's dotfiles

## Dependencies

- [GNU stow](https://www.gnu.org/software/stow/)

## Usage

```bash
cd ~/.dotfiles
```

To symlink everything:

```bash
stow *
```

To symlink only some packages:

```bash
stow zsh fzf
```

###  Environment variables used:

| Name | Description | Default |
| --- | --- | --- |
| `THEME` | The Base16 theme that will be used for Base16 Shell and FZF | `default-dark` |

