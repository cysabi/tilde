function tilde

    if not test -d ~/.local/share/tilde
        echo "tilde doesn't exist! writing..."
        git clone https://github.com/cysabi/tilde ~/.local/share/tilde
    end

    # sub-commands
    if not set -q argv[1]
        echo "(｡•̀ᴗ-)✧ ☆ ～"

    else if test $argv[1] = install
        sudo pacman -Syu base base-devel fish helix eza bat ripgrep macchina

    else if test $argv[1] = reload
        sudo nixos-rebuild switch
        sudo cp -a /etc/nixos/.config/. ~/.config/

    else if test $argv[1] = source
        cp -a ~/.local/share/tilde/.config/. ~/.config/

    else if test $argv[1] = open
        $EDITOR ~/.local/share/tilde

    else
        echo "（ゝ。∂）"

    end
end
