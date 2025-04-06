set -gx EDITOR nvim
set -gx WORKSPACE $HOME/workspace

fish_add_path -g "$HOME/.cargo/bin"
fish_add_path -g "$HOME/.local/bin"

eval (ssh-agent -c) &>/dev/null

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_config theme choose "Catppuccin Mocha"

    function starship_transient_rprompt_func
        starship module time
    end
    starship init fish | source
    enable_transience

    zoxide init fish | source

    # Just some niceness
    alias cd="z"
    alias cat="bat"
    alias ls="eza --icons"
    alias tree="eza --icons --tree"

    alias nv="nvim"
    alias n="nvim"
    alias v="nvim"
    alias vim="nvim"
    alias vi="nvim"
end
