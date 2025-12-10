function tilde

    if not test -d ~/.local/share/tilde
        echo "(｡- .•) tilde doesn't exist! writing..."
        git clone https://github.com/cysabi/tilde ~/.local/share/tilde
    end

    # sub-commands
    if not set -q argv[1]
        echo "(｡•̀ᴗ-)✧ ☆ ～"

    else if test $argv[1] = install
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
        paru -Sua atuin lf eza bat ripgrep macchina

    else if test $argv[1] = source
        cd ~/.local/share/tilde
        git pull
        cp -avfs ~/.local/share/tilde/.config/. ~/.config/
        fish

    else if test $argv[1] = open
        hx ~/.local/share/tilde

    else
        echo "（ゝ。∂）"

    end
end
