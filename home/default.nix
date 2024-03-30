{ pkgs, username, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./git
    ./neofetch
    ./kitty.nix
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
    ];

  };
  programs = {
    tmux.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
