function tilde
    if not test -d /etc/nixos/.git
        echo "tilde doesn't exist! writing..."
        sudo rm -rfv /etc/nixos
        git clone https://github.com/cysabi/tilde ~/_tilde
        sudo mv ~/_tilde /etc/nixos
    end
    # subcommands
    if not set -q argv[1]
        echo "(｡•̀ᴗ-)✧ ☆ ～"
    else if test $argv[1] = get
        nix profile install (for pkg in $argv[2..] ; echo "nixpkgs#"$pkg; end)
    else if test $argv[1] = reload
        sudo nixos-rebuild switch
        sudo cp -a /etc/nixos/.config/. ~/.config/
    else if test $argv[1] = source
        sudo cp -a /etc/nixos/.config/. ~/.config/
    else if test $argv[1] = open
        sudo hx --config ~/.config/helix/config.toml /etc/nixos
    else
        echo "（ゝ。∂）"
    end
end
