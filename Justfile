help:
    echo "Available environments are available:"
    echo "  - install-fish-env - Installs fish shell and some useful tools"

install-fish-env:
    tuckr add fish
    tuckr add bat
    tuckr add direnv
    tuckr add fastfetch
    tuckr add nvim
    tuckr add tmux
