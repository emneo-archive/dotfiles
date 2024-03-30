{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs =
    { nixpkgs
    , ...
    }:
    let
      system = "x86_64-linux";

      pkgs-settings = {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs = (import nixpkgs pkgs-settings);
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;
      nixosConfigurations = {
        jiyu = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hardware-configuration.nix
          ];
        };
      };
    };

}
