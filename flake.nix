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
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nvf,
    plasma-manager,
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
            plasma-manager.flake = plasma-manager;
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
            extraSpecialArgs = {inherit nvf plasma-manager;};
            users.pas = import ./pas;
          };
        }
      ];
    };
  };
}
