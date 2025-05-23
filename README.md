# My dotfiles

Shared dotfiles that I write in my spare time, so I have a uniform environment between my work and home machine.

## Setup

```bash
cargo install cargo-nextest cargo-deny cargo-watch tuckr just --locked
rustup component add rust-analyzer
```

### Ubuntu

```sh
sudo apt install starship kitty neovim tmux bat eza zoxide fzf fastfetch

just install-fish-env

chsh $USER -s /usr/bin/fish
```
