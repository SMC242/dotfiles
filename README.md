# SMC242/dotfiles

This is my personal repository of dotfiles

# Manual tasks

- Install all software in `programs-list`
- Configure `git-credential-manager`
  - Set up GPG
  - See https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/credstores.md
- Use GNU stow to put the configs in the correct places
  - `stow --target=$HOME .`
- Install [`tpm`](https://github.com/tmux-plugins/tpm)
