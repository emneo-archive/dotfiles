{ pkgs, username, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./git
    ./neofetch
    ./kitty.nix
    ./bash
    ./vim
    ./tmux
    ./extra_files.nix
    ./btop
    ./nvim
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      EDITOR = "vim";
    };

    stateVersion = "23.11";

    packages = with pkgs; [
      neofetch
      onefetch
      tmux
      spotify
      gimp
      ncdu
      distrobox
      tldr
      tokei
      ripgrep
      restic
      rclone
      vesktop
      signal-desktop
      ungoogled-chromium
      file
      zip
      unzip
      bitwarden
      prismlauncher
      libreoffice
      exegol
      thunderbird
      ffmpeg
      fastfetch
      tauon
      qbittorrent
      stremio
      zathura
      lutris
      unipicker
      xclip
      obs-studio
      python312Packages.black
      gnome.dconf-editor
    ];

  };
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/mutter" = {
        edge-tiling = true;
        attach-modal-dialogs = true;
        dynamic-workspaces = true;
      };
      "org/gnome/desktop/media-handling".autorun-never = true;
      "org/gnome/desktop/notifications".show-in-lock-screen = false;
      "org/gnome/system/location".enabled = true;
      "org/gnome/desktop/background" = {
        picture-uri = "/home/${username}/assets/wallpaper.png";
        picture-uri-dark = "/home/${username}/assets/wallpaper.png";
      };
      "org/gnome/desktop/screensaver".picture-uri = "/home/${username}/assets/wallpaper.png";
      "org/gnome/settings-daemon/plugins/power" = {
        idle-dim = false;
        power-saver-profile-on-low-battery = false;
      };
      "org/gnome/desktop/interface".show-battery-percentage = true;
    };
  };
  # TODO: Setup proper gnome settings
  #gnome = {
  #  extensions.enabledExtensions = with pkgs.gnomeExtensions; [
  #    blur-my-shell
  #  ];
  #  monospaceFont = {
  #    package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
  #    name = "JetBrainsMono";
  #    size = 15;
  #  };
  #};
}
