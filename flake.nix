{
  description = "VM Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: {
    inherit nixpkgs;
    nixosConfigurations.pas-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
	./global

	# Flakes in Registry
	{
	  nix.registry = {
	    nixpkgs.flake = nixpkgs;
	    home-manager.flake = home-manager;
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
	    #extraSpecialArgs = { inherit inputs; };
	    users.pas = import ./pas;
	  };
	}
      ];
    };
  };
}
