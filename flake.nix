{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs =
    { nixpkgs
    , nixos-hardware
    , pre-commit-hooks
    , ...
    }:
    let
      system = "x86_64-linux";

      pkgs-settings = {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs = (import nixpkgs pkgs-settings);

      mod-hardware = with nixos-hardware.nixosModules; [
        framework-12th-gen-intel
      ];
    in
    rec {
      formatter.${system} = pkgs.nixpkgs-fmt;
      nixosConfigurations = {
        jiyu = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hardware-configuration.nix
          ] ++ mod-hardware;
        };
      };
      checks.${system}.pre-commit-check = pre-commit-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          nixpkgs-fmt = {
            enable = true;
            name = pkgs.lib.mkForce "Nix files format";
          };
        };
      };
      devShells.${system}.default = pkgs.mkShell {
        inherit (checks.${system}.pre-commit-check) shellHook;
      };
    };

}
