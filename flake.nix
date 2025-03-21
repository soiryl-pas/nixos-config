{
  description = "VM Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf/v0.7";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nvf,
    ...
  }: {
    inherit nixpkgs;
    nixosConfigurations.pas-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./global

        # Flakes in Registry
        {
          nix.registry = {
            nixpkgs.flake = nixpkgs;
            home-manager.flake = home-manager;
            nvf.flake = nvf;
          };
        }

        # Custom Settings
        {
          custom = {
            defaultDisplayManager = "greetd";
          };
        }

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "orig.home";
            extraSpecialArgs = { inherit nvf; };
            users.pas = import ./pas;
          };
        }
      ];
    };
  };
}
