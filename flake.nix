{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-wsl,
      ...
    }@inputs:
    {

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-wsl.nixosModules.default
            {
              nix.settings.experimental-features = [
                "nix-command"
                "flakes"
              ];
              wsl.enable = true;
              # wsl.defaultUser = "cysabi";

              # windows terminal fix
              environment.variables.COLORTERM = "truecolor";

              # vscode remote
              programs.nix-ld = {
                enable = true;
              };

              # packages
              environment.systemPackages = with pkgs; [
                macchina

                # archives
                zip
                xz
                unzip
                p7zip

                # networking tools
                mtr # A network diagnostic tool
                iperf3
                dnsutils # `dig` + `nslookup`
                ldns # replacement of `dig`, it provide the command `drill`
                aria2 # A lightweight multi-protocol & multi-source command-line download utility
                socat # replacement of openbsd-netcat
                nmap # A utility for network discovery and security auditing
                ipcalc # it is a calculator for the IPv4/v6 addresses

                # misc
                file
                which
                gnused
                gnutar
                gawk
                zstd
                gnupg

                # nix related
                #
                # it provides the command `nom` works just like `nix`
                # with more details log output
                nix-output-monitor

                bottom # replacement of htop/nmon
                iotop # io monitoring
                iftop # network monitoring

                # system call monitoring
                strace # system call monitoring
                ltrace # library call monitoring
                lsof # list open files

                # system tools
                sysstat
                lm_sensors # for `sensors` command
                ethtool
                pciutils # lspci
                usbutils # lsusb
              ];

              system.stateVersion = "25.05";
            }
          ];
        };
      };
    };
}
