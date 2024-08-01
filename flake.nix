#
# NixOS Flake Definition
#
{
  description = "NixOS";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Flatpak source
    flatpaks.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, home-manager, flatpaks, ... }@inputs: {
    nixosConfigurations = {
      # Framework 16
      poseidon = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/poseidon.nix

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;
            home-manager.users.awm = import ./users/awm;
          }
        ];
      };
    };
  };
}
