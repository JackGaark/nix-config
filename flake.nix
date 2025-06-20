{
  description = "Jack's dotfiles — Darwin + Home Manager + devShell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      type = "github";
      owner = "LnL7";
      repo = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      type = "github";
      owner = "catppuccin";
      repo = "nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    evergarden = {
      type = "github";
      owner = "everviolet";
      repo = "nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tgirlpkgs = {
      type = "github";
      owner = "tgirlcloud";
      repo = "pkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    izvim = {
      type = "github";
      owner = "isabelroses";
      repo = "nvim";
    };

    ivy = {
      type = "github";
      owner = "comfysage";
      repo = "ivy";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      # Temporarily remove custom lib to test
      # lib = import ./modules/flake/lib { lib = inputs.nixpkgs.lib; inherit inputs; };
      flake = inputs.flake-parts.lib.mkFlake { inherit inputs; } {
        systems = [ "aarch64-darwin" ];
        # imports = [ ./modules/flake ];
      };
      outputs = flake // {
        # lib = lib;
        darwinConfigurations.jack = inputs.darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            inputs.home-manager.darwinModules.home-manager
            inputs.agenix.nixosModules.default
            {
              system.stateVersion = 6;

              nixpkgs.config.allowUnfree = true;
              nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (inputs.nixpkgs.lib.getName pkg) [
                "gh-copilot"
                "discord"
              ];
              nixpkgs.config.allowUnsupportedSystem = true;

              # Age secrets configuration
              age = {
                ageBin = "${inputs.nixpkgs.legacyPackages.aarch64-darwin.rage}/bin/rage";
                secretsDir = "/private/tmp/agenix";
                secretsMountPoint = "/private/tmp/agenix.d";

                secrets = {
                  # GitHub SSH keys
                  keys-gh = {
                    file = ./secrets/keys/gh.age;
                    mode = "600";
                    owner = "jackgaarkeuken";
                  };
                  keys-gh-pub = {
                    file = ./secrets/keys/gh-pub.age;
                    mode = "644";
                    owner = "jackgaarkeuken";
                  };

                  # AUR SSH keys
                  keys-aur = {
                    file = ./secrets/keys/aur.age;
                    mode = "600";
                    owner = "jackgaarkeuken";
                  };
                  keys-aur-pub = {
                    file = ./secrets/keys/aur-pub.age;
                    mode = "644";
                    owner = "jackgaarkeuken";
                  };

                  # NixOS SSH keys
                  keys-nixos = {
                    file = ./secrets/keys/nixos.age;
                    path = "/Users/jackgaarkeuken/.ssh/id_ed25519";
                    mode = "600";
                    owner = "jackgaarkeuken";
                  };
                  keys-nixos-pub = {
                    file = ./secrets/keys/nixos-pub.age;
                    path = "/Users/jackgaarkeuken/.ssh/id_ed25519.pub";
                    mode = "644";
                    owner = "jackgaarkeuken";
                  };

                  # Wakatime config
                  wakatime = {
                    file = ./secrets/isabel/wakatime.age;
                    path = "/Users/jackgaarkeuken/.config/wakatime/.wakatime.cfg";
                    mode = "600";
                    owner = "jackgaarkeuken";
                  };

                  # Nix auth tokens
                  nix-auth-tokens = {
                    file = ./secrets/isabel/nix-auth-tokens.age;
                    mode = "600";
                    owner = "jackgaarkeuken";
                  };

                  # Uni configuration
                  uni-gitconf = {
                    file = ./secrets/uni/gitconf.age;
                    mode = "600";
                    owner = "jackgaarkeuken";
                  };
                  uni-ssh = {
                    file = ./secrets/uni/ssh.age;
                    mode = "600";
                    owner = "jackgaarkeuken";
                  };

                  # ORACLE VPS keys
                  keys-openvpn = {
                    file = ./secrets/keys/openvpn.age;
                    mode = "600";
                    owner = "jackgaarkeuken";
                  };
                  keys-amity = {
                    file = ./secrets/keys/amity.age;
                    mode = "600";
                    owner = "jackgaarkeuken";
                  };
                };
              };

              # Basic system packages
              environment.systemPackages = with inputs.nixpkgs.legacyPackages.aarch64-darwin; [
                vim
                wget
                curl
                git
                htop
                tree
                ripgrep
                fd
                fzf
                bat
                eza
                starship
                zoxide
                atuin
                gh
                jj
                lazygit
                neovim
                syncthing
                rnnoise
                # Additional packages
                tmux
                jq
                yq
                socat
                nmap
                openssh
                age
                rage
                # Development tools
                nodejs
                python3
                rustc
                cargo
                # Additional utilities
                unzip
                zip
                p7zip
                rsync
                parallel
                moreutils
                # Text processing
                gawk
                coreutils
                findutils
                # Network tools
                mtr
                dig
                whois
                # Add more packages as needed
              ];

              # System environment
              environment.variables = {
                EDITOR = "nvim";
                VISUAL = "nvim";
                PAGER = "less";
                MANPAGER = "less -R";
                FLAKE = "/Users/jackgaarkeuken/nix-config";
                NH_FLAKE = "/Users/jackgaarkeuken/nix-config";
                # Additional environment variables
                LANG = "en_US.UTF-8";
                LC_ALL = "en_US.UTF-8";
                TERM = "xterm-256color";
              };

              # Enable system services
              nix.enable = true;

              # Set primary user for darwin defaults
              system.primaryUser = "jackgaarkeuken";

              # Darwin-specific settings
              system.defaults.dock.autohide = true;
              system.defaults.dock.mru-spaces = false;
              system.defaults.dock.show-recents = false;
              system.defaults.dock.tilesize = 48;

              system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
              system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
              system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;

              system.defaults.finder.AppleShowAllExtensions = true;
              system.defaults.finder.QuitMenuItem = true;
              system.defaults.finder.ShowPathbar = true;
              system.defaults.finder.ShowStatusBar = true;

              # Additional darwin settings
              system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
              system.defaults.NSGlobalDomain.InitialKeyRepeat = 10;
              system.defaults.NSGlobalDomain.KeyRepeat = 1;

              system.defaults.NSGlobalDomain.AppleShowScrollBars = "Always";
              system.defaults.NSGlobalDomain.AppleScrollerPagingBehavior = true;

              system.defaults.dock.orientation = "left";
              system.defaults.dock.showhidden = true;

              system.defaults.finder.FXPreferredViewStyle = "Nlsv";
              system.defaults.finder._FXShowPosixPathInTitle = true;

              # Security settings
              system.defaults.NSGlobalDomain.AppleEnableSwipeNavigateWithScrolls = false;
              system.defaults.NSGlobalDomain.AppleEnableMouseSwipeNavigateWithScrolls = false;

              users.users.jackgaarkeuken = {
                home = "/Users/jackgaarkeuken";
                shell = inputs.nixpkgs.lib.mkDefault "/bin/zsh";
              };

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                backupFileExtension = "backup";
                users.jackgaarkeuken = {
                  home.homeDirectory = "/Users/jackgaarkeuken";
                  home.stateVersion = "24.11";
                  home.username = "jackgaarkeuken";
                  imports = [ ./home/jackgaarkeuken ];
                };
              };

              # Enable additional services
              # services.syncthing.enable = true;

              # Fonts
              fonts.packages = with inputs.nixpkgs.legacyPackages.aarch64-darwin; [
                nerd-fonts.fira-code
                nerd-fonts.jetbrains-mono
                nerd-fonts.hack
                noto-fonts
                noto-fonts-cjk-sans
                noto-fonts-emoji
                liberation_ttf
                fira-code
                fira-code-symbols
                mplus-outline-fonts.githubRelease
                dina-font
                proggyfonts
              ];

              # Networking
              networking.hostName = "jack-macbook";
              networking.computerName = "Jack's MacBook";

              # Security
              security.pam.services.sudo_local.touchIdAuth = true;

              # Launchd services
              launchd.daemons = {
                # Add custom launchd services here if needed
              };

              # Additional system settings
              system.activationScripts.postActivation.text = ''
                # Custom post-activation scripts
                echo "System configuration applied successfully!"
              '';
            }
          ];
        };
      };
    in
      outputs;
}
