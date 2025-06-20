{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Development tools
    nodejs
    python3
    rustc
    cargo
    go
    clang
    cmake
    ninja
    meson

    # Text editors and IDEs
    vscode
    helix
    micro

    # Version control
    git-credential-manager
    git-lfs

    # Cloud and deployment
    docker
    docker-compose
    kubectl
    terraform

    # Database tools
    postgresql
    sqlite

    # Monitoring and debugging
    htop
    lsof

    # Additional utilities
    tldr
    cheat
    navi
    fzf
    ripgrep
    fd
    bat
    eza
    duf
    procs
    bottom
    gitui
    delta
    difftastic

    # Media tools
    ffmpeg
    imagemagick
    exiftool

    # Security tools
    gpg-tui
    pass
    age
    rage

    # Network tools
    mtr
    dig
    whois
    nmap
    socat
    netcat
    curl
    wget
    httpie

    # System tools
    pv
    progress
    rsync
    jq
    yq
    xan
    csvkit

    # Fun tools
    cowsay
    fortune
    sl
    cmatrix
    neofetch
    onefetch
  ];
}
